# frozen_string_literal: true

require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
  end

  test 'should get index' do
    get articles_path
    assert_response :success
  end

  test 'should new article' do
    get new_article_path, params: { article: { body: 'Rails is awesome!', title: 'Hello Rails' } },
                          headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret') }
    assert_response :success
  end

  test 'should get show' do
    get articles_path(@article.id)
    assert_response :success
  end

  test 'should get edit' do
    get edit_article_path(@article.id),
        headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret') }
    assert_response :success
  end

  test 'should create article' do
    post articles_path, params: { article: { body: 'Rails is awesome!', title: 'Hello Rails' } },
                        headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret') }

    new_article = Article.find_by title: 'Hello Rails'
    assert new_article.present?
  end

  test 'should update article' do
    patch article_path(@article.id), params: { article: { body: 'Rails is do awesome!', title: 'Hello Rails also' } },
                                     headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret') }

    @article.reload
    assert @article.title.eql?('Hello Rails also')
  end

  test 'should destroy article' do
    delete article_path(@article.id),
           headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret') }
    assert !Article.exists?(id: @article.id)
  end
end

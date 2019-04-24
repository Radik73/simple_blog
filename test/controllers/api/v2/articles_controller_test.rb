# frozen_string_literal: true

require 'test_helper'

class Api::V2::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test 'should create article' do
    post api_v2_articles_path, params: { 'title': 'Test article', 'text': 'Test article body' }
    assert_response :success
    data = JSON.parse(response.body)
    created_article = Article.find(data['data']['id'])
    assert created_article.present?
  end
end

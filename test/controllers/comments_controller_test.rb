# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
    @comment = @article.comments
  end

  test 'should create comment' do
    post article_comments_path(@article.id), params: { comment: { body: 'Comment from Alex', commenter: 'Alex' } }

    new_comment = Comment.find_by commenter: 'Alex'
    assert new_comment.present?
  end

  test 'should destroy article' do
    delete article_comment_path(@article.id, @comment.ids),
           headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret') }
    assert !Comment.exists?(id: @comment.ids)
  end
end

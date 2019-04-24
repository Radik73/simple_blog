# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @article = articles(:one)
  end

  test 'valid comment' do
    comment =  Comment.new(commenter: 'Alex', body: 'Body text', article: @article)
    assert comment.valid?
  end

  test 'invalid comment without article' do
    comment = Comment.new(commenter: 'Alex', body: 'Body text')
    assert comment.invalid?
  end
end

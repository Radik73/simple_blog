# frozen_string_literal: true

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'valid article' do
    article = Article.new(title: 'Title', text: 'Body text')
    assert article.valid?
  end
end

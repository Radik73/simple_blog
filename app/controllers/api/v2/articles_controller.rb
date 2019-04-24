# frozen_string_literal: true

class Api::V2::ArticlesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    article = Article.new(article_params)

    if article.save
      render json: { status: 'SUCCESS', message: 'Saved article', data: article }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Article not saved',
                     data: article.errors }, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.permit(:title, :text)
  end
end

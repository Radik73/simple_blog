# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  namespace :api do
    namespace :v2 do
      resources :articles
    end
  end

  root 'welcome#index'
end

Rails.application.routes.draw do
  
  root to: 'static#index'

  namespace :admin do
    root to: 'main#index'
    resources :news_articles
    resources :testimonials
  end
end

Rails.application.routes.draw do
  
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  
  root to: 'static#index'

  namespace :admin do
    root to: 'main#index'
    resources :news_articles
    resources :testimonials
    resources :users
    resources :careers_items
  end
end

DbcRspecRails::Application.routes.draw do
  namespace :admin do
    resources :posts
  end

  resources :posts
  resources :sessions

  root :to => "home#index"
end

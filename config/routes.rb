Rails.application.routes.draw do
  namespace :author do
    get 'quotes/index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :quotes, only: :index
  resources :author, only: :index

  namespace :author do
    resources :quotes, only: :index
  end
end

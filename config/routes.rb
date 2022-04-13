Rails.application.routes.draw do
  resources :preferences
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  scope "(:locale)", locale: /en|es|fr/ do
    resources :users, only: [:new, :show]
    root 'welcome#index'
  end
end

Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "success", to: "success#index"

  scope "(:locale)", locale: /en|es|fr/ do
    resources :users, only: [:new]
    root 'users#new'
  end
end

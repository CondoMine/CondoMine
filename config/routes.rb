Rails.application.routes.draw do
  devise_for :users

  authenticate :user do
    resources :funcionarios
    resources :items
    resources :ambientes
    resources :reservas
    resources :condominos

    get 'welcome/index'
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Defines the root path route ("/")
    # root "articles#index"
    root "welcome#index"
  end
end

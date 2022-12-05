Rails.application.routes.draw do
  resources :events
  resources :spots do
    collection do
      get :stolen_bike
    end
  end
  devise_for :users
  authenticated :user do
    root to: "spots#index", as: :authenticated_root
  end

  unauthenticated do
    root to: "pages#home"
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "profile", to: "pages#profile"


  # Defines the root path route ("/")
  # root "articles#index"
end

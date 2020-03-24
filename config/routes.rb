Rails.application.routes.draw do
  devise_for :users,
    controllers: {registrations: "registrations"}

  root to: "pages#home"

  get "/users/:id", to: "users#show", as: "user"
  resources :posts, only: %i(new create index show destroy) do
    resources :photos, only: %i(create)
    resources :comments, only: %i(create destroy)
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

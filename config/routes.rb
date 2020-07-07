Rails.application.routes.draw do
  resources :psychologies
  resources :genres

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins
  devise_for :users,
    controllers: {registrations: "registrations"}

  root to: "pages#home"

  resources :users, only: %i(show) do
    get "passport_comprated" => "passports#comprated"
    resources :passports, only: %i(index new create destroy edit update) do
      resources :schedules, only: %i(create destroy update)
    end
  end
  resources :posts, only: %i(new create index show destroy) do
    resources :photos, only: %i(create)
    resources :comments, only: %i(create destroy)
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

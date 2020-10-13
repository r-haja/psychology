Rails.application.routes.draw do
  resources :psychologies
  resources :genres
  resources :notification_comments, only: %i(new edit update destroy create)

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins
  devise_for :users,
    controllers: {registrations: "registrations"}

  root to: "pages#home"
  get "admin_top" => "admins#top"
  get "notification_create" => "admins#notification_create"
  get "porpose_create" => "pages#porpose_create"
  get "psychology_ranking" => "psychologies#ranking"
  post "schedules/create_index" => "schedules#create_index", as: "schedule_index_create"

  resources :users, only: %i(show) do
    resources :passports, only: %i(index show new create destroy edit update) do
      get "passport_comprated" => "passports#comprated"
      resources :schedules, only: %i(create destroy update)
    end
  end
  resources :posts, only: %i(new create index show destroy) do
    resources :photos, only: %i(create)
    resources :comments, only: %i(create destroy)
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root "events#index"
  resources :users, only: :show
  resources :events do
    resources :participations, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
end

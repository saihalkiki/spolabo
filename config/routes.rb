Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root "events#index"

  resources :users, only: [:new, :show, :edit, :update] do
    member do
      get :join
      get :recruit
    end
  end

  resources :events do
    resources :participations, only: [:create, :destroy]
    get 'search', on: :collection
  end
end

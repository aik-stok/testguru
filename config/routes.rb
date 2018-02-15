Rails.application.routes.draw do


  root 'tests#index'
  get :login, to: 'sessions#new'
  get :signup, to: 'users#new'
  get :logout, to: 'sessions#destroy'

  resources :sessions, only: :create
  resources :users, only: :create

  resources :tests do
    member do
      post :start
    end
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
  end
  
  resources :assignments, only: %i[show update] do
    member do
      get :result
    end
  end
end

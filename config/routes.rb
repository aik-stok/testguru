Rails.application.routes.draw do
  get 'users/new'

  root 'tests#index'
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

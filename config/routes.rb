Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path_names: {sign_in: :login, sign_out: :logout}

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

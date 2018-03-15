Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path_names: {sign_in: :login, sign_out: :logout}

  resources :tests, only: :index do
    member do
      post :start
    end
#    resources :questions, shallow: true, except: :index do
#      resources :answers, shallow: true, except: :index
 #   end
  end
  
  resources :assignments, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end
  
  namespace :admin do
    resources :gists, only: :index
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end

Rails.application.routes.draw do

  devise_scope :user do
    authenticated :user do
      root 'pages#welcome'
    end
    unauthenticated :user do
      root :to => 'users#show',  as:  :unauthenticated_root
    end
  end

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  devise_scope :user do
    get "/logout" => "devise/sessions#destroy"
  end

  ActiveAdmin.routes(self)

  get 'test' => 'pages#tests'
  get '/users/:id' => 'users#show'

  resources :questions, only: [:index, :new, :create]
  resources :topics, only: [:index, :show, :new, :create]

  resources :users, only: [:create, :edit, :new, :show, :testpage, :update] do
    resources :test_suits, only: [:index, :new, :show] do
      post :complete
    end
  end

end

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'pages#home'

  devise_for :users

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  resources :conversations do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end

  get 'messages', to: 'static_pages#messages'
  get 'messages/open', to: 'messages#create'

  get '/account/', to: 'pages#account', as: 'show_current_account'
  get '/payments/success', to: 'payments#success', as: 'success_payment'
  get '/payments/failure', to: 'payments#failure', as: 'failure_payment'
  post '/payments/webhook', to: 'payments#webhook'
end

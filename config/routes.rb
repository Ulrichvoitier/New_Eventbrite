Rails.application.routes.draw do
  resources :testings

  # Defines the root path route ("/")
  root "events#index"

  get 'users/show'

  get 'static_pages/index'
  get 'static_pages/secret'

  devise_for :users

  resources :events, only: [:index, :show, :new, :create]
  
  get 'users/:id' => 'users#show', as: :user
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  scope '/checkout' do
    post 'create' => 'checkout#create', as: 'checkout_create' 
    get 'success' => 'checkout#success', as: 'checkout_success'
    get 'cancel' => 'checkout#cancel', as: 'checkout_cancel'
  end

end

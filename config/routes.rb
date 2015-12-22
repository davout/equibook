Rails.application.routes.draw do

  resources :images, only: [:show, :create, :index]

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :horses do
    resources :activities
  end

  namespace :admin do
    %w{ users horses colors genders activities }.each do |res|
      resources(res) { as_routes }
    end
  end

  get :terms_of_service,  to: 'pages#terms_of_service'
  get :privacy_policy,    to: 'pages#privacy_policy'

  root to: 'pages#landing'

end

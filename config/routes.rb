Rails.application.routes.draw do

  resources :images
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :horses do
    resources :activities
  end

  namespace :admin do
    %w{ users horses colors genders activities }.each do |res|
      resources(res) { as_routes }
    end
  end

  root to: 'pages#landing'

end

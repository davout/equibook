Rails.application.routes.draw do
  devise_for :users
  resources :horses

  namespace :admin do
    %w{ users horses colors genders }.each do |res|
      resources(res) { as_routes }
    end
  end

  root to: 'pages#landing'
end

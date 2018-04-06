Rails.application.routes.draw do
  root to: 'homepage#show'

  namespace :admin do
    resources :parties
  end
end

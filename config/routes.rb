Rails.application.routes.draw do
  root to: 'homepage#show'

  resource :sessions

  namespace :authenticated, path: 'me' do
    resource :dashboards
  end

  namespace :admin do
    resources :parties
    resources :communications
  end
end

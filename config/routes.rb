Rails.application.routes.draw do
  root to: 'homepage#show'

  resource :sessions

  namespace :authenticated, path: 'me' do
    resource :dashboards
    scope module: 'communications' do
      resources :questions, only: []do
        resource :response, only: :create
      end
    end
  end

  namespace :admin do
    root to: 'dashboards#show'
    resources :parties
    resources :communications do
      resources :sends, module: :communications
    end
  end

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(Rails.application.config.admin.username)) &
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(Rails.application.config.admin.password))
  end if Rails.env.production?
  mount Sidekiq::Web, at: "/sidekiq"

end

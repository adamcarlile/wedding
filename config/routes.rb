Rails.application.routes.draw do
  root to: 'homepage#show'

  resource :sessions

  namespace :authenticated, path: 'me' do
    resource :dashboards
    resources :communications
    resource :details
    resource :content, only: [] do
      get "about-us", to: 'about_us', as: 'about_us'
      get "q-and-a", to: 'q_and_a', as: 'q_and_a'
      get "details", to: 'details', as: 'details'
      get "how-to-get-here", to: 'how_to_get_here', as: 'how_to_get_here'
      get "where-to-stay", to: 'where_to_stay', as: 'where_to_stay'
      get "things-to-do", to: 'things_to_do', as: 'things_to_do'
    end
    resources :events do
      resources :invitees do
        resource :attendances, path: ':event', only: [:create, :update]
      end
    end
    scope module: 'communications' do
      resources :questions, only: [] do
        resource :response, only: :create
      end
    end
  end

  namespace :admin do
    root to: 'dashboards#show'
    resources :parties
    resources :events do
      resources :invitees do
        resource :attendances, path: ':event', only: [:create, :update]
      end
    end
    resources :communications do
      resources :sends, only: :create, module: :communications
      resources :deliveries, module: :communications, only: [] do
        post :redeliver
      end
    end
  end

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(Rails.application.config.admin.username)) &
      ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(Rails.application.config.admin.password))
  end if Rails.env.production?
  mount Sidekiq::Web, at: "/sidekiq"

end

require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Wedding
  class Application < Rails::Application
    # Ensuring that ActiveStorage routes are loaded before Comfy's globbing
    # route. Without this file serving routes are inaccessible.
    config.railties_order = [ActiveStorage::Engine, :main_app, :all]
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.action_mailer.smtp_settings = {
      authentication: :plain,
      address: ENV.fetch("SMTP_ADDRESS") { "localhost" },
      port: ENV.fetch("SMTP_PORT") { 1025 },
      domain: ENV.fetch("SMTP_DOMAIN") { nil },
      user_name: ENV.fetch("SMTP_USER_NAME") { nil},
      password: ENV.fetch("SMTP_PASSWORD") { nil }
    }.reject {|k, v| v.blank? }

    config.action_mailer.default_url_options = {
      host: ENV.fetch("APPLICATION_HOSTNAME") { 'localhost' },
      port: ENV.fetch("APPLICATION_PORT")     { 3000 },
      scheme: ENV.fetch("APPLICATION_SCHEME") { 'http' }
    }.reject {|k, v| v.blank? }
  
    config.roadie.url_options = {
      host: ENV.fetch("APPLICATION_HOSTNAME") { 'localhost' },
      port: ENV.fetch("APPLICATION_PORT")     { 3000 },
      scheme: ENV.fetch("APPLICATION_SCHEME") { 'http' }
    }.reject {|k, v| v.blank? }
    
    config.admin = ActiveSupport::OrderedOptions.new.tap do |admin|
      admin.username    = ENV['ADMIN_USERNAME']
      admin.password    = ENV['ADMIN_PASSWORD']
    end

    if ENV["RAILS_LOG_TO_STDOUT"].present?
      log_level                = String(ENV['LOG_LEVEL'] || "info").upcase
      config.logger            = ActiveSupport::Logger.new(STDOUT)
      config.logger.level      = Logger.const_get(log_level)
      config.log_level         = log_level
      config.lograge.formatter = Lograge::Formatters::Json.new
      config.lograge.enabled   = true
    end

    # Don't generate system test files.
    config.active_job.queue_adapter = :sidekiq
    config.generators.system_tests  = nil
  end
end

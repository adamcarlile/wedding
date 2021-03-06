source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0.rc2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sassc-rails'
gem 'uglifier', '>= 1.3.0'
gem 'slim'
gem 'bulma-rails', '~> 0.6.2'
gem 'simple_form'
gem 'font-awesome-rails'
gem "cocoon"
gem 'jquery-rails'
gem 'builder'
gem "lograge"
gem 'rails_warden'
gem 'virtus'
gem "transitions", require: ["transitions", "active_model/transitions"]
gem 'sidekiq', require: ["sidekiq", "sidekiq/web"]
gem 'roadie-rails'
gem 'draper'
gem 'country_select'
gem 'aasm'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'intl-tel-input-rails'
gem 'rollbar'
gem 'image_processing'

gem 'bootsnap', '>= 1.1.0', require: false

group :production do
  gem "aws-sdk-s3", require: false
end

group :development, :test do
  gem "better_errors"
  gem "binding_of_caller"
  gem "pry-rails"
  gem "faker"
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

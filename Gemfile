source 'https://rubygems.org'

# ruby version used
ruby '2.5.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.4'

# Use Puma as the app server
gem 'puma'

# Use postgres as the database for Active Record
gem 'pg', '~> 0.18.4'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Convert HTML To PDF
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2.2'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'active_model_serializers', '0.9.3'
gem 'fcm'
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'ransack', github: 'activerecord-hackery/ransack'

gem 'amoeba'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Image Processign Library
gem 'rmagick'
# Easy file attachment management for ActiveRecord
gem 'paperclip'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
gem 'rabl'
gem 'rack-cors', require: 'rack/cors'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Devise for users
gem 'devise'

# User cancancan for authorization
gem 'cancancan', '~> 2.0'

# API related gems
gem 'httparty'
gem 'responders'
gem 'rest-client', '~> 2.0'

# Swagger - API Documentation
gem 'swagger-docs'

# .ENV
gem 'dotenv-rails'

gem 'city-state'

# Imaging
gem 'carrierwave'
gem 'carrierwave-base64'
gem 'carrierwave-video-thumbnailer'
gem 'copy_carrierwave_file'
gem 'mini_magick', '~> 4.8'

# Auth gems
gem 'oauth'
gem 'omniauth'
gem 'omniauth-facebook' # for sign_in with facebook
gem 'omniauth-google-oauth2'
gem 'simple_token_authentication', '~> 1.0'

# For Charts
gem 'fusioncharts-rails'

# QR Code generation
gem 'rqrcode'

# Barcode dependancies
gem 'barby'
gem 'chunky_png'

# Pagination gems
gem 'kaminari'

# Other gems
gem 'activerecord-import'
gem 'acts_as_tree', '~> 2.4'
gem 'acts_as_votable'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.42'
gem 'cocoon'
gem 'country_select'
gem 'file_validators'
gem 'font-awesome-rails'
gem 'geocoder'
gem 'has_scope'
gem 'jquery-timepicker-rails'
gem 'momentjs-rails', '>= 2.9.0'
gem 'nested_form'
gem 'pg_search'
gem 'rails-i18n', '~> 5.1'
gem 'redis'
gem 'redis-namespace'
gem 'rubyzip'
gem 'sentry-raven'
gem 'sidekiq'
gem 'sitemap_generator', '~> 6.0', '>= 6.0.1'
gem 'stripe'
gem 'tzinfo-data'

# Listen
# Unused gems
# gem 'ancestry'
# gem 'unicorn'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'annotate'
  gem 'byebug'
  gem 'factory_bot_rails'
  gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
  gem 'pry-byebug'
  gem 'rack-test', '~> 0.7.0'
  gem 'rails-erd'
  gem 'rspec-rails', '~> 3.8'
  gem 'webmock'
  # Listen
end

group :development do
  gem 'listen'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.5.1'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Capistrano for deployment
  gem 'capistrano', '~> 3.7', '>= 3.7.1'
  gem 'capistrano-passenger', '~> 0.2.0'
  gem 'capistrano-rails', '~> 1.2'
  gem 'capistrano-rbenv', '~> 2.1'

  # Other gems
  gem 'brakeman', require: false
  gem 'rails_best_practices'
  gem 'rubocop', '~> 0.58.2', require: false
end

group :test do
  gem 'database_cleaner', '~> 1.6', '>= 1.6.2'
  gem 'rails-controller-testing' # If you are using Rails 5.x
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'simplecov', require: false
end

group :production do
  gem 'rails_12factor'
end

source "https://rubygems.org"

gem "rails", '~> 4.1.0'
gem "turbolinks"

gem "exception_notification"

gem "capistrano", "~> 3.2.1"
gem "open4"
gem "coderay"
gem 'paper_trail', '~> 4.0.0.beta'
gem "devise", "~> 3.2.4"
gem "devise-encryptable"

gem 'mysql2', '>= 0.3.12b4'

gem 'slim-rails'
gem 'sass-rails',   '~> 4.0.3'
gem 'coffee-rails', '~> 4.0.0'
#gem 'coffee-script-source', '1.8.0'

gem "jquery-rails"
gem "jquery-turbolinks"
gem "jquery-ui-rails"
gem "uglifier", '>= 1.3.0'
gem 'therubyracer', platforms: :ruby

# capistrano
gem 'capistrano-rails'
gem 'capistrano-bundler'
gem 'capistrano-rbenv'
gem 'capistrano-rvm'

gem 'whenever', :require => false

# other data
gem 'sshkey'
gem 'annotate'

group :development do
  gem 'spring'
  gem "thin"
  gem "pry"
  gem "pry-rails"
  if RUBY_VERSION >= '2.0.0'
    gem 'pry-byebug'
  else
    gem "debugger"
    gem "pry-debugger"
  end
  # better errors
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem "sqlite3"
  gem "mocha", :require => false
  gem "factory_girl_rails"
  gem "database_cleaner"
  gem 'minitest-reporters'
end

group :production do
  gem "unicorn"
end

if File.exists?('config/Gemfile.extras')
  eval File.read('config/Gemfile.extras')
end

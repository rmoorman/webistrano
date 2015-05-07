source "https://rubygems.org"

gem "rails", '~> 4.1.0'

gem "exception_notification"

gem "capistrano", "~> 3.2.1"
gem "open4"
gem "coderay"
gem "version_fu", :git => "https://github.com/jmckible/version_fu.git"
gem "devise", "~> 3.2.4"
gem "devise-encryptable"

gem 'mysql2'

gem "jquery-rails"
gem "uglifier"
gem 'therubyracer'

gem 'capistrano-rails'
gem 'capistrano-bundler'
gem 'capistrano-rbenv'
gem 'capistrano-rvm'

gem 'whenever', :require => false

group :development do
  gem "thin"
  gem "debugger"
  gem "pry"
  gem "pry-rails"
  gem "pry-debugger"
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

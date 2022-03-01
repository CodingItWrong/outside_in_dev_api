source 'https://rubygems.org'

ruby '3.1.0'

gem 'rails', '~> 7.0.2'
gem 'pg', '~> 1.3'
gem 'puma', '~> 5.6'
gem 'sass-rails', '>= 6'
gem 'rack-cors'

group :development do
  gem 'dotenv-rails'
  gem 'listen', '~> 3.7'
end

group :development, :test do
  gem 'coderay'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop'
end

group :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'rspec_junit_formatter'
  gem 'selenium-webdriver'
end

group :production do
  gem 'rack-attack'
end

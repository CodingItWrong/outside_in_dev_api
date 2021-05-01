source 'https://rubygems.org'

ruby '3.0.1'

gem 'rails', '~> 6.1.3.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.3'
gem 'rack-cors'

group :development do
  gem 'bullet'
  gem 'dotenv-rails'
  gem 'listen', '~> 3.5'
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

source "https://rubygems.org"

ruby "3.2.0"

gem "rails", "~> 7.0.4"
gem "pg", "~> 1.4"
gem "puma", "~> 6.1"
gem "sass-rails", ">= 6"
gem "rack-cors"

group :development do
  gem "dotenv-rails"
  gem "listen", "~> 3.8"
end

group :development, :test do
  gem "coderay"
  gem "rspec-rails"
  gem "standard"
end

group :test do
  gem "capybara"
  gem "factory_bot_rails"
  gem "rspec_junit_formatter"
  gem "selenium-webdriver"
end

group :production do
  gem "rack-attack"
end

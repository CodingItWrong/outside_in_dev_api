source "https://rubygems.org"

ruby "3.2.0"

gem "rails", "~> 7.2.2"
gem "pg", "~> 1.5"
gem "puma", "~> 6.5"
gem "sass-rails", ">= 6"
gem "rack-cors"

group :development do
  gem "dotenv-rails"
  gem "listen", "~> 3.9"
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
end

group :production do
  gem "rack-attack"
end

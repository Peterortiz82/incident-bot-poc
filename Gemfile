source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.0"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "slack-ruby-client"

group :development, :test do
  gem 'dotenv-rails'
  gem 'pry-rails', '~> 0.3.9'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 5.1', '>= 5.1.1'
end

group :development do
  gem "web-console"
end

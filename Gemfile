# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.7.3'

gem 'graphql', '~> 1.13'
gem 'jwt', '~> 2.3'
gem 'puma', '~> 5.2'
gem 'rack-contrib', '~> 2.3'
gem 'rack-cors', '~> 1.1'
gem 'rake', '~> 12.3'
gem 'sequel', '~> 5.43'
gem 'sequel_secure_password', '~> 0.2'
gem 'sinatra', '~> 2.1'
gem 'sinatra-contrib', '~> 2.1'

group :development do
  gem 'better_errors', '~> 2.9'
  gem 'binding_of_caller', '~> 1.0'
  gem 'dotenv', '~> 2.7'
  gem 'pry-byebug', '~> 3.9'
  gem 'racksh', '~> 1.0'
  gem 'ruby_graphiql_explorer', '~> 1.0'
end

group :test do
  gem 'factory_bot', '~> 6.2'
  gem 'rack-test', '~> 1.1'
  gem 'rspec', '~> 3.10'
  gem 'rspec_sequel_matchers', '~> 0.5'
  gem 'warning', '~> 1.2'
end

group :development, :test do
  gem 'flay', '~> 2.12'
  gem 'flog', '~> 4.6'
  gem 'rubocop', '~> 1.12'
  gem 'rubocop-graphql', '~> 0.12'
  gem 'rubocop-performance', '~> 1.13'
  gem 'rubocop-rake', '~> 0.5'
  gem 'rubocop-rspec', '~> 2.2'
  gem 'rubocop-sequel', '~> 0.2'
  gem 'simplecov', '~> 0.21', require: false
  gem 'sqlite3', '~> 1.4'
end

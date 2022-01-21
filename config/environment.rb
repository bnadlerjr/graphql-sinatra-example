# frozen_string_literal: true

require 'bundler/setup'

unless 'production' == ENV['RACK_ENV']
  require 'dotenv'
  Dotenv.load
end

require_relative '../app'

configure do
  # Configuration common to all environments goes here...
end

configure :development do
  require 'better_errors'
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __dir__)
end

configure :test do
  set :raise_errors, true
  set :dump_errors, false
  set :show_exceptions, false
end

configure :production do
  before do
    redirect request.url.sub('http', 'https') unless request.secure?
  end
end

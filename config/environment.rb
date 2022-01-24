# frozen_string_literal: true

require 'bundler/setup'

unless 'production' == ENV['RACK_ENV']
  require 'dotenv'
  Dotenv.load
end

require_relative 'db'

require 'rack/cors'
require 'rack/contrib'
require 'sinatra/json'
require_relative '../app'

configure do
  use Rack::Cors do
    allow do
      origins '*'
      resource '/graphql', headers: :any, methods: :post
    end
  end

  use Rack::JSONBodyParser,
      verbs: ['POST'], media: ['application/json', 'application/vnd.api+json']

  enable :sessions
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

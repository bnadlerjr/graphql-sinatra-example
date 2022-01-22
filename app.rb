# frozen_string_literal: true

require 'sinatra'
require 'sinatra/json'

require_relative 'app/gql_example'

get '/' do
  json message: 'Smoke test successful!'
end

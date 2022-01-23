# frozen_string_literal: true

require 'sinatra'
require_relative 'lib/gql_example'

get '/' do
  json message: 'Smoke test successful!'
end

post '/graphql' do
  json GqlExample::GraphQL::Schema.execute(
    params[:query],
    variables: params[:variables],
    context: { current_user: nil }
  )
end

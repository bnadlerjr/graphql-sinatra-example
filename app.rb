# frozen_string_literal: true

require 'sinatra'
require_relative 'lib/gql_example'

helpers do
  def current_user
    GqlExample::User.from_token(session[:token])
  end
end

get '/' do
  json message: 'Smoke test successful!'
end

post '/graphql' do
  json GqlExample::GraphQL::Schema.execute(
    params[:query],
    variables: params[:variables],
    context: {
      current_user: current_user,
      session: session
    }
  )
end

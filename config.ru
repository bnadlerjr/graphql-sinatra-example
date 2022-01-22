# frozen_string_literal: true

require_relative 'config/environment'

if 'development' == ENV.fetch('RACK_ENV', 'production')
  require 'ruby_graphiql_explorer'
  run Rack::URLMap.new(
    '/' => Sinatra::Application,
    '/graphiql' => RubyGraphiqlExplorer::App
  )
else
  run Sinatra::Application
end

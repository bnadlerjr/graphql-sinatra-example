# frozen_string_literal: true

namespace :graphql do
  desc 'Dump the GraphQL Schema to an SDL file'
  task :dump do
    graphql_path = File.join('lib', 'gql_example', 'graphql')
    require_relative File.join('..', graphql_path, 'schema')
    schema_definition = GqlExample::GraphQL::Schema.to_definition
    schema_path = File.join(graphql_path, 'schema.graphql')
    msg = <<~TEXT
      # This file was generated by the `graphql:dump` Rake task. Do NOT
      # modify this file manually.
    TEXT
    File.write(schema_path, "#{msg}\n#{schema_definition}")
    puts "\n<= Dumped GraphQL schema to #{schema_path}"
  end
end

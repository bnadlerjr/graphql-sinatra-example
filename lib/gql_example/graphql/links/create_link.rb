# frozen_string_literal: true

module GqlExample
  module GraphQL
    # Mutation to create a new Link
    #
    class CreateLink < BaseMutation
      description 'Create a new link'
      null false
      argument :description, String, 'Description of Link', required: true
      argument :url, String, 'URL of Link', required: true

      type GqlExample::GraphQL::LinkType

      def resolve(params)
        GqlExample.create_link(params.merge(user: context[:current_user]))
      rescue Sequel::ValidationFailed => e
        ::GraphQL::ExecutionError.new("Invalid input: #{e.message}")
      end
    end
  end
end

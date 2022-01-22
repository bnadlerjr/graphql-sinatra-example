# frozen_string_literal: true

module GqlExample
  module GraphQL
    # Mutation to create a new Link
    #
    class CreateLink < ::GraphQL::Schema::Mutation
      description 'Create a new link'
      null false
      argument :description, String, 'Description of Link', required: true
      argument :url, String, 'URL of Link', required: true

      type GqlExample::GraphQL::LinkType

      def resolve(description: nil, url: nil)
        Link.create(
          description: description,
          url: url
        )
      end
    end
  end
end

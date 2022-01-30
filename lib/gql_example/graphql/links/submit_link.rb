# frozen_string_literal: true

module GqlExample
  module GraphQL
    module Links
      # Mutation to create a new Link
      #
      class SubmitLink < BaseMutation
        description 'Submit a new link'
        null false
        argument :description, String, 'Description of Link', required: true
        argument :url, String, 'URL of Link', required: true

        type 'GqlExample::GraphQL::Links::LinkType'

        def resolve(params)
          GqlExample.submit_link(params.merge(user: context[:current_user]))
        rescue Sequel::ValidationFailed => e
          ::GraphQL::ExecutionError.new("Invalid input: #{e.message}")
        end
      end
    end
  end
end

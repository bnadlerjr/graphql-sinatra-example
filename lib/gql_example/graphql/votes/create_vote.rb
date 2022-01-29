# frozen_string_literal: true

module GqlExample
  module GraphQL
    # Mutation to create a new Vote.
    #
    class CreateVote < BaseMutation
      description 'Creates a new vote'

      argument :link_id, ID, 'ID of the Link to vote for', required: true

      type GqlExample::GraphQL::VoteType

      def resolve(params)
        GqlExample.create_vote(params.merge(user: context[:current_user]))
      rescue Sequel::ValidationFailed => e
        ::GraphQL::ExecutionError.new("Invalid input: #{e.message}")
      end
    end
  end
end

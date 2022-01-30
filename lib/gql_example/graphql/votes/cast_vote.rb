# frozen_string_literal: true

module GqlExample
  module GraphQL
    module Votes
      # Mutation to create a new Vote.
      #
      class CastVote < BaseMutation
        description 'Creates a new vote'

        argument :link_id, ID, 'ID of the Link to vote for', required: true

        type 'GqlExample::GraphQL::Votes::VoteType'

        def resolve(params)
          GqlExample.cast_vote(params.merge(user: context[:current_user]))
        rescue Sequel::ValidationFailed => e
          ::GraphQL::ExecutionError.new("Invalid input: #{e.message}")
        end
      end
    end
  end
end

# frozen_string_literal: true

module GqlExample
  module GraphQL
    module Votes
      class VoteType < BaseObject
        description 'Vote type'

        field :id, ID, 'Unique ID of the Vote', null: false

        field :link, 'GqlExample::GraphQL::Links::LinkType',
              null: false,
              description: 'Link for casted vote'

        field :user, 'GqlExample::GraphQL::Users::UserType',
              null: false,
              description: 'User who casted the vote'
      end
    end
  end
end

# frozen_string_literal: true

module GqlExample
  module GraphQL
    class VoteType < BaseObject
      description 'Vote type'

      field :id, ID, 'Unique ID of the Vote', null: false

      field :link, 'GqlExample::GraphQL::LinkType',
            null: false,
            description: 'Link for casted vote'

      field :user, 'GqlExample::GraphQL::UserType',
            null: false,
            description: 'User who casted the vote'
    end
  end
end

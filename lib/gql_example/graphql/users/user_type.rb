# frozen_string_literal: true

module GqlExample
  module GraphQL
    module Users
      class UserType < BaseObject
        description 'User type'

        field :id, ID,
              null: false,
              description: 'Unique ID of the User'

        field :email, String,
              null: false,
              description: 'User email address'

        field :name, String,
              null: false,
              description: 'Name of the User'

        field :links, ['GqlExample::GraphQL::Links::LinkType'],
              null: false,
              description: 'List of links the user has submitted'

        field :votes, ['GqlExample::GraphQL::Votes::VoteType'],
              null: false,
              description: 'List of votes the user has casted'
      end
    end
  end
end

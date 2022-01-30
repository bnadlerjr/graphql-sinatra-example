# frozen_string_literal: true

module GqlExample
  module GraphQL
    class LinkType < BaseObject
      description 'Link type'

      field :id, ID, null: false, description: 'Unique ID of the Link'

      field :description, String,
            null: false,
            description: 'Description of the Link'

      field :posted_by, 'GqlExample::GraphQL::UserType',
            null: true,
            method: :user,
            description: 'User who posted the Link'

      field :url, String,
            null: false,
            description: 'URL of the Link'

      field :votes, ['GqlExample::GraphQL::VoteType'],
            null: false,
            description: 'List of votes for the Link'
    end
  end
end

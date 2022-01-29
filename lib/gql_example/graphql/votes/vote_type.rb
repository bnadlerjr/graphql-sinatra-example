# frozen_string_literal: true

module GqlExample
  module GraphQL
    class VoteType < BaseObject
      description 'Vote type'

      field :id, ID, 'Unique ID of the Vote', null: false

      field :link, LinkType, 'Link for casted vote', null: false
      field :user, UserType, 'User who casted the vote', null: false
    end
  end
end

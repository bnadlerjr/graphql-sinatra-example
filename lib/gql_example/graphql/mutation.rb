# frozen_string_literal: true

module GqlExample
  module GraphQL
    class MutationType < BaseObject
      description 'Root for all mutations'

      field :create_link,
            description: 'Create a new link',
            mutation: CreateLink
    end
  end
end

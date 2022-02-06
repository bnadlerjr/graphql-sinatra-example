# frozen_string_literal: true

module GqlExample
  module GraphQL
    # The root GraphQL query type.
    #
    class QueryType < BaseObject
      description 'The root query type'

      field :fetch_links,
            resolver: Links::LinkSearch,
            description: 'Fetch Links.'
    end
  end
end

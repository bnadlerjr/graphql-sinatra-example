# frozen_string_literal: true

module GqlExample
  module GraphQL
    # The root GraphQL query type.
    #
    class QueryType < BaseObject
      description 'The root query type'

      field :all_links, [Links::LinkType], 'Returns all Link entries', null: false

      def all_links
        GqlExample.fetch_all_links
      end
    end
  end
end

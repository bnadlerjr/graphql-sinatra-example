# frozen_string_literal: true

module GqlExample
  module GraphQL
    # The root GraphQL query type.
    #
    class QueryType < ::GraphQL::Schema::Object
      description 'The root query type'

      field :all_links, [LinkType], 'Returns all Link entries', null: false

      def all_links
        GqlExample::Link.all
      end
    end
  end
end

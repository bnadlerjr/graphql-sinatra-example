# frozen_string_literal: true

module GqlExample
  module GraphQL
    module Links
      # Resolves Link searches.
      #
      class LinkSearch < BaseResolver
        description 'Search for Links.'

        type [LinkType], null: false

        argument :description, [String],
                 required: false,
                 description: 'Description to filter by.'

        argument :url, [String],
                 required: false,
                 description: 'URL to filter by.'

        def resolve(url: nil, description: nil)
          GqlExample.search_links(url: url, description: description)
        end
      end
    end
  end
end

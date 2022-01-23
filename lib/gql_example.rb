# frozen_string_literal: true

require_relative 'gql_example/link'
require_relative 'gql_example/user'

require_relative 'gql_example/graphql/schema'

# Example GraphQL app.
#
module GqlExample
  class << self
    def create_link(params)
      Link.create(params)
    end

    def fetch_all_links
      Link.all
    end

    def create_user(params)
      User.create(params)
    end
  end
end

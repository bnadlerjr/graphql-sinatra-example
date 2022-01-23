# frozen_string_literal: true

require 'graphql'

require_relative 'links/link_type'
require_relative 'links/create_link'
require_relative 'mutation'
require_relative 'query'

module GqlExample
  module GraphQL
    class Schema < ::GraphQL::Schema
      description 'The GqlExample schema'

      mutation MutationType
      query QueryType
    end
  end
end
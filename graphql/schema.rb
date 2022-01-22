# frozen_string_literal: true

require 'graphql'

require_relative 'link_type'
require_relative 'query'

module GqlExample
  module GraphQL
    class Schema < ::GraphQL::Schema
      description 'The GqlExample schema'

      query QueryType
    end
  end
end

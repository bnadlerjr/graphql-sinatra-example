# frozen_string_literal: true

module GqlExample
  module GraphQL
    class Schema < ::GraphQL::Schema
      description 'The GqlExample schema'

      query QueryType
    end
  end
end

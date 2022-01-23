# frozen_string_literal: true

module GqlExample
  module GraphQL
    class BaseMutation < ::GraphQL::Schema::Mutation
      description 'All mutations inherit from this class.'
      null false
    end

    class BaseObject < ::GraphQL::Schema::Object
      description 'All objects inherit from this class.'
    end
  end
end
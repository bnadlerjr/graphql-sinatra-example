# frozen_string_literal: true

module GqlExample
  module GraphQL
    class MutationType < BaseObject
      description 'Root for all mutations'

      field :create_link,
            description: 'Create a new link',
            mutation: CreateLink

      # rubocop:disable GraphQL/ExtractType
      field :create_user,
            description: 'Create a new user',
            mutation: CreateUser
      # rubocop:enable GraphQL/ExtractType

      field :signin_user, description: 'Sign user in', mutation: SignIn
    end
  end
end

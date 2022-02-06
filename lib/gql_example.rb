# frozen_string_literal: true

require 'jwt'

require_relative 'gql_example/auth_token'
require_relative 'gql_example/link'
require_relative 'gql_example/user'
require_relative 'gql_example/vote'

require_relative 'gql_example/graphql/schema'

# Example GraphQL app.
#
module GqlExample
  class << self
    def submit_link(params)
      Link.create(params)
    end

    def search_links(params)
      Link.search(params)
    end

    def register_user(params)
      User.create(params)
    end

    def sign_in(email, password)
      user = User.where(email: email).first
      return unless user&.authenticate(password)

      user
    end

    def cast_vote(params)
      Vote.create(params)
    end
  end
end

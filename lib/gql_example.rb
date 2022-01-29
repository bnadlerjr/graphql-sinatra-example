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
    def create_link(params)
      Link.create(params)
    end

    def fetch_all_links
      Link.all
    end

    def create_user(params)
      User.create(params)
    end

    def sign_in(email, password)
      user = User.where(email: email).first
      return unless user&.authenticate(password)

      user
    end
  end
end

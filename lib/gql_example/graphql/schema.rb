# frozen_string_literal: true

require 'graphql'

require_relative 'base'

require_relative 'links/link_type'
require_relative 'links/link_search'
require_relative 'links/submit_link'

require_relative 'users/user_type'
require_relative 'users/auth_credentials_input'
require_relative 'users/register_user'
require_relative 'users/sign_in'

require_relative 'votes/vote_type'
require_relative 'votes/cast_vote'

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

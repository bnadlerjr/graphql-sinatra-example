# frozen_string_literal: true

module GqlExample
  module GraphQL
    class MutationType < BaseObject
      description 'Root for all mutations'

      field :submit_link,
            description: 'Create a new link',
            mutation: Links::SubmitLink

      field :register_user,
            description: 'Create a new user',
            mutation: Users::RegisterUser

      field :cast_vote,
            description: 'Vote for a link',
            mutation: Votes::CastVote

      field :signin_user, description: 'Sign user in', mutation: Users::SignIn
    end
  end
end

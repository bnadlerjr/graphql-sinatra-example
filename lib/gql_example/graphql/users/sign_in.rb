# frozen_string_literal: true

module GqlExample
  module GraphQL
    # Sign-in a user.
    #
    class SignIn < BaseMutation
      description 'Authenticate a user'

      argument :credentials, AuthCredentialsInput, 'Auth credentials', required: false

      field :token, String, 'User token', null: true
      field :user, UserType, 'The User', null: true

      def resolve(credentials: nil)
        return unless credentials

        user = GqlExample.sign_in(credentials[:email], credentials[:password])
        return unless user

        { token: user.token, user: user }
      end
    end
  end
end

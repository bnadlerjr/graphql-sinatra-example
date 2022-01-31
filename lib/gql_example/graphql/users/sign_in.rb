# frozen_string_literal: true

module GqlExample
  module GraphQL
    module Users
      # Sign-in a user.
      #
      class SignIn < BaseMutation
        description 'Authenticate a user'
        null true

        argument :credentials, 'GqlExample::GraphQL::Users::AuthCredentialsInput',
                 required: false,
                 description: 'Auth credentials'

        field :token, String,
              null: true,
              description: 'User token'

        field :user, 'GqlExample::GraphQL::Users::UserType',
              null: true,
              description: 'The User'

        def resolve(credentials: nil)
          return unless credentials

          user = GqlExample.sign_in(credentials[:email], credentials[:password])
          return unless user

          { token: user.token, user: user }
        end
      end
    end
  end
end

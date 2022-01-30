# frozen_string_literal: true

module GqlExample
  module GraphQL
    # Mutation to register a new User
    #
    class RegisterUser < BaseMutation
      class AuthSignupData < BaseInputObject
        description 'Signup data'
        argument :credentials, 'GqlExample::GraphQL::AuthCredentialsInput',
                 required: false,
                 description: 'Auth credentials'
      end

      description 'Register a new user'
      argument :auth, AuthSignupData, 'Signup data', required: false
      argument :name, String, 'Name of user', required: true

      type 'GqlExample::GraphQL::UserType'

      def resolve(name: nil, auth: nil)
        GqlExample.register_user(
          name: name,
          email: auth&.[](:credentials)&.[](:email),
          password: auth&.[](:credentials)&.[](:password),
          password_confirmation: auth&.[](:credentials)&.[](:password)
        )
      rescue Sequel::ValidationFailed => e
        ::GraphQL::ExecutionError.new("Invalid input: #{e.message}")
      end
    end
  end
end

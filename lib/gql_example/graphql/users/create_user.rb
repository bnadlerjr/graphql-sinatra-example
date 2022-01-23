# frozen_string_literal: true

module GqlExample
  module GraphQL
    # Mutation to create a new User
    #
    class CreateUser < BaseMutation
      class AuthSignupData < BaseInputObject
        description 'Signup data'
        argument :credentials, AuthCredentialsInput, 'Auth credentials', required: false
      end

      description 'Create a new user'
      argument :auth, AuthSignupData, 'Signup data', required: false
      argument :name, String, 'Name of user', required: true

      type GqlExample::GraphQL::UserType

      def resolve(name: nil, auth: nil)
        GqlExample.create_user(
          name: name,
          email: auth&.[](:credentials)&.[](:email),
          password: auth&.[](:credentials)&.[](:password),
          password_confirmation: auth&.[](:credentials)&.[](:password_confirmation)
        )
      rescue Sequel::ValidationFailed => e
        ::GraphQL::ExecutionError.new("Invalid input: #{e.message}")
      end
    end
  end
end

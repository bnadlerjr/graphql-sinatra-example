# frozen_string_literal: true

module GqlExample
  module GraphQL
    module Users
      # Mutation to register a new User
      #
      class RegisterUser < BaseMutation
        class AuthSignupData < BaseInputObject
          description 'Signup data'
          argument :credentials, 'GqlExample::GraphQL::Users::AuthCredentialsInput',
                   required: false,
                   description: 'Auth credentials'
        end

        description 'Register a new user'
        argument :auth, AuthSignupData, 'Signup data', required: false
        argument :name, String, 'Name of user', required: true

        type 'GqlExample::GraphQL::Users::UserType'

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
end

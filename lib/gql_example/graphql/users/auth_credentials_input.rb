# frozen_string_literal: true

module GqlExample
  module GraphQL
    class AuthCredentialsInput < BaseInputObject
      description 'Auth credentials'
      graphql_name 'AUTH_CREDENTIALS'

      argument :email, String, 'User email', required: true
      argument :password, String, 'User password', required: true

      # rubocop:disable GraphQL/ExtractInputType
      argument :password_confirmation,
               String,
               'User password confirmation',
               required: true
      # rubocop:enable GraphQL/ExtractInputType
    end
  end
end

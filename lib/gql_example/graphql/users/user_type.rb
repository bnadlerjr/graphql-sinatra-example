# frozen_string_literal: true

module GqlExample
  module GraphQL
    class UserType < BaseObject
      description 'User type'

      field :id, ID, 'Unique ID of the User', null: false

      field :email, String, 'User email address', null: false
      field :name, String, 'Name of the User', null: false
    end
  end
end

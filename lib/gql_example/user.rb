# frozen_string_literal: true

module GqlExample
  # Represents an authenticated user of the application.
  #
  class User < ::Sequel::Model
    plugin :secure_password
    plugin :validation_helpers

    def validate
      super

      validates_presence %i[email name]
      validates_unique :email
    end
  end
end

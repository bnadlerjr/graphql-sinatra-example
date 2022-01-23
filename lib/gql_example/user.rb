# frozen_string_literal: true

module GqlExample
  # Represents an authenticated user of the application.
  #
  class User < ::Sequel::Model
    plugin :secure_password
    plugin :validation_helpers

    def token
      AuthToken.encode({ 'user-id' => id })
    end

    def validate
      super

      validates_presence %i[email name]
      validates_unique :email
    end

    def self.from_token(token)
      return unless token&.match?(/[^[:space:]]/)

      decoded = AuthToken.decode(token)
      self[decoded['user-id']]
    end
  end
end

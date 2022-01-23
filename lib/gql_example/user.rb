# frozen_string_literal: true

module GqlExample
  # Represents an authenticated user of the application.
  #
  class User < ::Sequel::Model
    plugin :secure_password
    plugin :validation_helpers

    # Helper method for generating a JWT. Note that this implementation is
    # for demo purposes only. It does NOT specify a signing algorithm and
    # is NOT INTENDED for production use.
    #
    # https://github.com/jwt/ruby-jwt#algorithms-and-usage
    #
    def token
      JWT.encode({ 'user-id' => id }, nil, 'none')
    end

    def validate
      super

      validates_presence %i[email name]
      validates_unique :email
    end
  end
end

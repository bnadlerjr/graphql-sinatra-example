# frozen_string_literal: true

module GqlExample
  # Wraps the JWT gem with some defaults.
  #
  module AuthToken
    class << self
      # Helper method for generating a JWT. Note that this implementation is
      # for demo purposes only. It does NOT specify a signing algorithm and
      # is NOT INTENDED for production use.
      #
      # https://github.com/jwt/ruby-jwt#algorithms-and-usage
      #
      def encode(payload)
        JWT.encode(payload, nil, 'none')
      end

      def decode(token)
        decoded, = JWT.decode(token, nil, false)
        decoded
      end
    end
  end
end

# frozen_string_literal: true

module GqlExample
  # Represents a +Link+ to a website.
  #
  class Link < ::Sequel::Model
    plugin :validation_helpers

    many_to_one :user

    def validate
      super

      validates_presence %i[url description user]
      validates_unique :url
    end
  end
end

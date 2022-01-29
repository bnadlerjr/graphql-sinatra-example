# frozen_string_literal: true

module GqlExample
  # Represents a user's +Vote+ for a +Link+.
  #
  class Vote < Sequel::Model
    plugin :validation_helpers

    many_to_one :link
    many_to_one :user

    def validate
      super

      validates_presence %i[link user]
    end
  end
end

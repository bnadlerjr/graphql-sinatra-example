# frozen_string_literal: true

module GqlExample
  # Represents a +Link+ to a website.
  #
  class Link < ::Sequel::Model
    plugin :validation_helpers

    many_to_one :user
    one_to_many :votes

    dataset_module do
      def search(params={})
        conditions = params.filter_map.flat_map do |k, v|
          Array(v).map { |sv| Sequel.ilike(k, "%#{sv}%") }
        end
        conditions.empty? ? all : where(Sequel.|(*conditions))
      end
    end

    def validate
      super

      validates_presence %i[url description user]
      validates_unique :url
    end
  end
end

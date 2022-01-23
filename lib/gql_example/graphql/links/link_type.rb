# frozen_string_literal: true

module GqlExample
  module GraphQL
    class LinkType < BaseObject
      description 'Link type'

      field :id, ID, 'Unique ID of the Link', null: false

      field :description, String, 'Description of the Link', null: false
      field :url, String, 'URL of the Link', null: false
    end
  end
end

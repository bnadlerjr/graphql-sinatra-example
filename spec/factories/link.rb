# frozen_string_literal: true

FactoryBot.define do
  factory :link, class: 'gql_example/link' do
    to_create(&:save_changes)

    url { 'http://example.com' }
    description { 'An example link.' }
    user
  end
end

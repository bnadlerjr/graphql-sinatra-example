# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'gql_example/user' do
    to_create(&:save_changes)

    name { 'John doe' }
    sequence(:email) { |n| "jdoe+#{n}@example.com" }
    password { 'secret' }
    password_confirmation { 'secret' }
  end
end

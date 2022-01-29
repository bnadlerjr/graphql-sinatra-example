# frozen_string_literal: true

# rubocop:disable RSpec/FilePath
RSpec.describe GqlExample::GraphQL::UserType do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type('ID!') }
  it { is_expected.to have_field(:email).of_type('String!') }
  it { is_expected.to have_field(:name).of_type('String!') }
end
# rubocop:enable RSpec/FilePath

# frozen_string_literal: true

# rubocop:disable RSpec/FilePath
RSpec.describe GqlExample::GraphQL::LinkType do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type('ID!') }
  it { is_expected.to have_field(:description).of_type('String!') }
  it { is_expected.to have_field(:posted_by).of_type('User') }
  it { is_expected.to have_field(:url).of_type('String!') }
  it { is_expected.to have_field(:votes).of_type('[Vote!]!') }
end
# rubocop:enable RSpec/FilePath

# frozen_string_literal: true

# rubocop:disable RSpec/FilePath
RSpec.describe GqlExample::GraphQL::VoteType do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type('ID!') }
  it { is_expected.to have_field(:link).of_type('Link!') }
  it { is_expected.to have_field(:user).of_type('User!') }
end
# rubocop:enable RSpec/FilePath

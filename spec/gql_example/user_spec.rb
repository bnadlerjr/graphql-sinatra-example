# frozen_string_literal: true

RSpec.describe GqlExample::User do
  subject(:user) { described_class.new }

  it { expect(user).to validate_presence(:email) }
  it { expect(user).to validate_unique(:email) }
  it { expect(user).to validate_presence(:name) }
end

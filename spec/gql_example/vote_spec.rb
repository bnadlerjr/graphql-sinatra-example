# frozen_string_literal: true

RSpec.describe GqlExample::Vote do
  subject(:vote) { described_class.new }

  it { expect(vote).to validate_presence(:link) }
  it { expect(vote).to validate_presence(:user) }
end

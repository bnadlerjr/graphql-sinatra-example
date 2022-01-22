# frozen_string_literal: true

RSpec.describe GqlExample::Link do
  subject(:link) { described_class.new }

  it { expect(link).to validate_presence(:url) }
  it { expect(link).to validate_unique(:url) }
  it { expect(link).to validate_presence(:description) }
end

# frozen_string_literal: true

# rubocop:disable RSpec/FilePath
RSpec.describe GqlExample::GraphQL::CastVote do
  subject(:mutation) do
    described_class.new(object: nil, field: nil, context: { current_user: user })
  end

  let(:user) { create(:user) }

  context 'with valid params' do
    let(:link) { create(:link) }
    let(:resolved_mutation) { mutation.resolve(link_id: link.id) }

    it 'creates the new vote record' do
      expect {
        resolved_mutation
      }.to change { GqlExample::Vote.count }.from(0).to(1)
    end

    it 'returns the vote object' do
      expect(resolved_mutation).to be_a(GqlExample::Vote)
    end
  end

  context 'with invalid params' do
    let(:resolved_mutation) do
      mutation.resolve(link_id: 'not a link id')
    end

    it 'does not create the new vote record' do
      expect {
        resolved_mutation
      }.not_to change { GqlExample::Vote.count }
    end

    it 'returns a GraphQL::ExecutionError' do
      expect(resolved_mutation.message).to \
        eq('Invalid input: link is not present')
    end
  end
end
# rubocop:enable RSpec/FilePath

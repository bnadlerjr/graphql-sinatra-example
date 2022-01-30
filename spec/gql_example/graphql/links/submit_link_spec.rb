# frozen_string_literal: true

# rubocop:disable RSpec/FilePath
RSpec.describe GqlExample::GraphQL::SubmitLink do
  subject(:mutation) do
    described_class.new(object: nil, field: nil, context: { current_user: user })
  end

  let(:user) { create(:user) }

  context 'with valid params' do
    let(:resolved_mutation) do
      mutation.resolve(
        url: 'http://example.com',
        description: 'An example'
      )
    end

    it 'creates the new link record' do
      expect {
        resolved_mutation
      }.to change { GqlExample::Link.count }.from(0).to(1)
    end

    it 'returns the link object' do
      expect(resolved_mutation).to be_a(GqlExample::Link)
    end
  end

  context 'with invalid params' do
    let(:resolved_mutation) do
      mutation.resolve(url: '', description: '')
    end

    it 'does not create the new link record' do
      expect {
        resolved_mutation
      }.not_to change { GqlExample::Link.count }
    end

    it 'returns a GraphQL::ExecutionError' do
      expect(resolved_mutation.message).to \
        eq('Invalid input: url is not present, description is not present')
    end
  end
end
# rubocop:enable RSpec/FilePath

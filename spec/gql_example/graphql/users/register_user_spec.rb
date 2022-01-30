# frozen_string_literal: true

# rubocop:disable RSpec/FilePath
RSpec.describe GqlExample::GraphQL::Users::RegisterUser do
  subject(:mutation) do
    described_class.new(object: nil, field: nil, context: {})
  end

  context 'with valid params' do
    let(:resolved_mutation) do
      mutation.resolve(
        name: 'John Doe',
        auth: {
          credentials: {
            email: 'jdoe@example.com',
            password: 'secret'
          }
        }
      )
    end

    it 'creates the new user record' do
      expect {
        resolved_mutation
      }.to change { GqlExample::User.count }.from(0).to(1)
    end

    it 'returns the user object' do
      expect(resolved_mutation).to be_a(GqlExample::User)
    end
  end

  context 'with invalid params' do
    let(:resolved_mutation) do
      mutation.resolve(
        name: 'John Doe',
        auth: {
          credentials: {
            email: '',
            password: 'secret'
          }
        }
      )
    end

    it 'does not create the new user record' do
      expect { resolved_mutation }.not_to change { GqlExample::User.count }
    end

    it 'returns a GraphQL::ExecutionError' do
      expect(resolved_mutation.message).to \
        eq('Invalid input: email is not present')
    end
  end
end
# rubocop:enable RSpec/FilePath

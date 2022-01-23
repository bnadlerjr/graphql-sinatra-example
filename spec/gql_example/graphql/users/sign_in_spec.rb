# frozen_string_literal: true

# rubocop:disable RSpec/FilePath
RSpec.describe GqlExample::GraphQL::SignIn do
  subject(:mutation) do
    described_class.new(object: nil, field: nil, context: {})
  end

  let!(:db_user) do
    GqlExample::User.create(
      name: 'John Doe',
      email: 'jdoe@example.com',
      password: 'secret',
      password_confirmation: 'secret'
    )
  end

  context 'with valid credentials' do
    let(:resolved_mutation) do
      mutation.resolve(credentials: { email: db_user.email, password: 'secret' })
    end

    it { expect(resolved_mutation[:token]).to eq(db_user.token) }
    it { expect(resolved_mutation[:user]).to eq(db_user) }
  end

  context 'with invalid credentials' do
    it 'returns nil' do
      result = mutation.resolve(
        credentials: { email: db_user.email, password: 'incorrect password' }
      )
      expect(result).to be(nil)
    end
  end

  context 'with missing credentials' do
    it 'returns nil' do
      expect(mutation.resolve).to be(nil)
    end
  end
end
# rubocop:enable RSpec/FilePath

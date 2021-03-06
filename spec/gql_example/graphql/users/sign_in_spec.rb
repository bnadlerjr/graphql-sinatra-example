# frozen_string_literal: true

# rubocop:disable RSpec/FilePath
RSpec.describe GqlExample::GraphQL::Users::SignIn do
  subject(:mutation) do
    described_class.new(object: nil, field: nil, context: context)
  end

  let(:context) { {} }
  let(:db_user) { create(:user) }

  context 'with valid credentials' do
    let(:resolved_mutation) do
      mutation.resolve(credentials: { email: db_user.email, password: 'secret' })
    end

    it { expect(resolved_mutation[:token]).to eq(db_user.token) }
    it { expect(resolved_mutation[:user]).to eq(db_user) }
  end

  context 'with invalid credentials' do
    let(:resolved_mutation) do
      mutation.resolve(
        credentials: { email: db_user.email, password: 'incorrect password' }
      )
    end

    it { expect(resolved_mutation).to be(nil) }

    it 'does not add the token to the session' do
      resolved_mutation
      expect(context).not_to have_key(:session)
    end
  end

  context 'with missing credentials' do
    let(:resolved_mutation) { mutation.resolve }

    it { expect(resolved_mutation).to be(nil) }

    it 'does not add the token to the session' do
      resolved_mutation
      expect(context).not_to have_key(:session)
    end
  end
end
# rubocop:enable RSpec/FilePath

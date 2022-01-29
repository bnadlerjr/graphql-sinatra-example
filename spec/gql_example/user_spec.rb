# frozen_string_literal: true

RSpec.describe GqlExample::User do
  subject(:user) { described_class.new }

  it { expect(user).to validate_presence(:email) }
  it { expect(user).to validate_unique(:email) }
  it { expect(user).to validate_presence(:name) }

  describe '.from_token' do
    context 'when the token is valid' do
      let(:db_user) { create(:user) }

      it 'returns the user associated with the token' do
        expect(described_class.from_token(db_user.token)).to eq(db_user)
      end

      it 'returns nil if a user is not associated with the token' do
        token = db_user.token
        db_user.destroy
        expect(described_class.from_token(token)).to be(nil)
      end
    end

    context 'when the token is invalid' do
      it 'returns nil if the token is nil' do
        expect(described_class.from_token(nil)).to be(nil)
      end

      it 'returns nil if the token is an empty string' do
        expect(described_class.from_token('   ')).to be(nil)
      end

      it 'returns nil if the token does not contain a user-id' do
        token = JWT.encode({ 'foo' => 1 }, nil, 'none')
        expect(described_class.from_token(token)).to be(nil)
      end

      it 'returns nil if the user-id cannot be coerced to an integer' do
        token = JWT.encode({ 'user-id' => 'not an integer' }, nil, 'none')
        expect(described_class.from_token(token)).to be(nil)
      end
    end
  end
end

# frozen_string_literal: true

RSpec.describe GqlExample::AuthToken do
  subject(:auth) { described_class }

  let(:valid_token) { 'eyJhbGciOiJub25lIn0.eyJ1c2VyLWlkIjoxfQ.' }

  describe '.encode' do
    it { expect(auth.encode({ 'user-id' => 1 })).to eq(valid_token) }
  end

  describe '.decode' do
    context 'when the token is valid' do
      it { expect(auth.decode(valid_token)).to eq({ 'user-id' => 1 }) }
    end

    context 'when the token is invalid' do
      it { expect(auth.decode('not.a.valid.token')).to eq({}) }
    end
  end
end

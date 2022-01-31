# frozen_string_literal: true

RSpec.describe 'signinUser mutation', type: :request do
  context 'when the user exists' do
    let(:user) { create(:user, password: 'secret') }

    context 'and the credentials are valid' do
      before do
        gql = build_gql(:signinUser, email: user.email, password: 'secret')
        post '/graphql', query: gql
      end

      it { expect(last_response).to have_http_status(:ok) }
      it { expect(last_response).to have_content_type(:json) }
      it { expect(json_body['data']['signinUser']).to include('token') }
      it { expect(json_body['data']['signinUser']['user']).to include('id') }
      it { expect(json_body).not_to include('errors') }
    end

    context 'and the credentials are invalid' do
      before do
        gql = build_gql(:signinUser, email: user.email, password: '')
        post '/graphql', query: gql
      end

      it { expect(last_response).to have_http_status(:ok) }
      it { expect(last_response).to have_content_type(:json) }
      it { expect(json_body['data']['signinUser']).to eq(nil) }
      it { expect(json_body).not_to include('errors') }
    end
  end

  context 'when the user does not exist' do
    before do
      gql = build_gql(:signinUser, email: 'no.such.user', password: 'secret')
      post '/graphql', query: gql
    end

    it { expect(last_response).to have_http_status(:ok) }
    it { expect(last_response).to have_content_type(:json) }
    it { expect(json_body['data']['signinUser']).to eq(nil) }
    it { expect(json_body).not_to include('errors') }
  end
end

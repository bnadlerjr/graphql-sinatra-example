# frozen_string_literal: true

RSpec.describe 'submitLink mutation', type: :request do
  let(:user) { create(:user) }

  context 'when the params are valid' do
    let(:valid_gql) do
      build_gql(:submitLink, url: 'http://example.com', description: 'An example')
    end

    context 'and the token is valid' do
      before do
        header 'Authorization', "Bearer #{user.token}"
        post '/graphql', query: valid_gql
      end

      it { expect(last_response).to have_http_status(:ok) }
      it { expect(last_response).to have_content_type(:json) }
      it { expect(json_body['data']['submitLink']).to include('id') }
      it { expect(json_body['data']['submitLink']['postedBy']['name']).to eq(user.name) }
      it { expect(json_body).not_to include('errors') }
    end

    context 'and the token is invalid' do
      before do
        header 'Authorization', 'Bearer invalid_token'
        post '/graphql', query: valid_gql
      end

      it { expect(last_response).to have_http_status(:ok) }
      it { expect(last_response).to have_content_type(:json) }
      it { expect(json_body).to include('errors') }
    end

    context 'and the token is missing' do
      before { post '/graphql', query: valid_gql }

      it { expect(last_response).to have_http_status(:ok) }
      it { expect(last_response).to have_content_type(:json) }
      it { expect(json_body).to include('errors') }
    end
  end

  context 'and the params are invalid' do
    let(:invalid_gql) do
      build_gql(:submitLink, url: '', description: 'An example link')
    end

    before do
      header 'Authorization', "Bearer #{user.token}"
      post '/graphql', query: invalid_gql
    end

    it { expect(last_response).to have_http_status(:ok) }
    it { expect(last_response).to have_content_type(:json) }
    it { expect(json_body).to include('errors') }
  end
end

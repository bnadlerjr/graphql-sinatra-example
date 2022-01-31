# frozen_string_literal: true

RSpec.describe 'castVote mutation', type: :request do
  let(:user) { create(:user) }
  let(:link) { create(:link) }

  context 'when the params are valid' do
    let(:valid_gql) do
      build_gql(:castVote, link_id: link.id)
    end

    context 'and the token is valid' do
      before do
        header 'Authorization', "Bearer #{user.token}"
        post '/graphql', query: valid_gql
      end

      it { expect(last_response).to have_http_status(:ok) }
      it { expect(last_response).to have_content_type(:json) }
      it { expect(json_body['data']['castVote']).to include('id') }
      it { expect(json_body['data']['castVote']['user']['id'].to_i).to eq(user.id) }
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
      build_gql(:castVote, link_id: 'no.such.link')
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

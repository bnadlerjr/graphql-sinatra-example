# frozen_string_literal: true

RSpec.describe 'fetchLinks query', type: :request do
  before { post '/graphql', query: build_gql(:fetchLinks) }

  it { expect(last_response).to have_http_status(:ok) }
  it { expect(last_response).to have_content_type(:json) }
  it { expect(json_body['data']).to include('fetchLinks') }
  it { expect(json_body).not_to include('errors') }
end

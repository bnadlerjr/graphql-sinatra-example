# frozen_string_literal: true

RSpec.describe 'allLinks query', type: :request do
  before { post '/graphql', query: build_gql(:allLinks) }

  it { expect(last_response).to have_http_status(:ok) }
  it { expect(last_response).to have_content_type(:json) }
  it { expect(json_body['data']).to include('allLinks') }
  it { expect(json_body).not_to include('errors') }
end

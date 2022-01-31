# frozen_string_literal: true

RSpec.describe 'registerUser mutation', type: :request do
  before do
    gql = build_gql(
      :registerUser,
      name: 'Jane Doe',
      email: 'jane.doe@example.com',
      password: 'secret'
    )
    post '/graphql', query: gql
  end

  it { expect(last_response).to have_http_status(:ok) }
  it { expect(last_response).to have_content_type(:json) }
  it { expect(json_body['data']['registerUser']).to include('id') }
  it { expect(json_body).not_to include('errors') }
end

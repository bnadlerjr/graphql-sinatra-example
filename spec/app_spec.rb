# frozen_string_literal: true

# rubocop:disable RSpec/DescribeClass
RSpec.describe 'GET /', rack: true do
  before { get '/' }

  it { expect(last_response).to have_http_status(:ok) }
  it { expect(last_response).to have_content_type(:json) }
  it { expect(last_response.body).to include('Smoke test successful!') }
end
# rubocop:enable RSpec/DescribeClass

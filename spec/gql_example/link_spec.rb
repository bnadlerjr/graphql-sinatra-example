# frozen_string_literal: true

RSpec.describe GqlExample::Link do
  subject(:link) { described_class.new }

  it { expect(link).to validate_presence(:url) }
  it { expect(link).to validate_unique(:url) }
  it { expect(link).to validate_presence(:description) }

  describe '.search' do
    {
      link_a: {
        url: 'http://example.com',
        description: 'An example website'
      },
      link_b: {
        url: 'http://my.example.com',
        description: 'Storefront for my website'
      },
      link_c: {
        url: 'http://acme.com',
        description: 'ACME Corp. example website'
      },
      link_d: {
        url: 'http://store.acme.com',
        description: 'ACME Corp. website'
      }
    }.each { |k, v| let!(k) { create(:link, **v) } }

    it 'can search by URL' do
      expect(described_class.search(url: 'eXaMpLE')).to \
        match_array([link_a, link_b])
    end

    it 'can search by description' do
      expect(described_class.search(description: 'ExaMPlE')).to \
        match_array([link_a, link_c])
    end

    it 'can search by url OR description' do
      params = { description: 'example', url: 'example' }
      expect(described_class.search(params)).to \
        match_array([link_a, link_b, link_c])
    end

    it 'can search by multiple URL values' do
      params = { url: %w[example store] }
      expect(described_class.search(params)).to \
        match_array([link_a, link_b, link_d])
    end

    it 'can search by multiple description values' do
      params = { description: %w[ACME store] }
      expect(described_class.search(params)).to \
        match_array([link_b, link_c, link_d])
    end

    it 'returns all links if params are not given' do
      expect(described_class.search).to \
        match_array([link_a, link_b, link_c, link_d])
    end

    it 'ignores nil values' do
      params = { url: nil }
      expect(described_class.search(params)).to \
        match_array([link_a, link_b, link_c, link_d])
    end

    it 'ignores empty values' do
      params = { url: [] }
      expect(described_class.search(params)).to \
        match_array([link_a, link_b, link_c, link_d])
    end
  end
end

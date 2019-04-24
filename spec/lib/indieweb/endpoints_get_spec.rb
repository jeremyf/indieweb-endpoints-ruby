describe IndieWeb::Endpoints, :get do
  let(:url) { 'https://example.com' }

  let :http_response_headers do
    { 'Content-Type': 'text/html' }
  end

  context 'when given a URL that does not advertise a Micropub endpoint' do
    before do
      stub_request(:get, url).to_return(headers: http_response_headers, body: read_fixture(url))
    end

    it 'returns nil' do
      expect(described_class.get(url)).to eq(micropub: nil, webmention: nil)
    end
  end
end

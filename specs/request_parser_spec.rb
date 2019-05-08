require_relative '../src/request_parser'

RSpec.describe 'Request Parser' do
  describe '.parse' do
    context 'when request is in correct format' do
      let(:request) { "GET / HTTP/1.1\nHost: localhost\nAccept: */*\r\n" }

      it 'returns a hash with its path, method and headers attributes' do
        expect(RequestParser.parse(request)).to eq({
          path: '/',
          method: 'GET',
          headers: {
            'Host' => 'localhost',
            'Accept' => '*/*'
          }
        })
      end
    end
  end

  describe '.parse_headers' do
    context 'when headers are in correct format' do
      let(:headers) { "Host: localhost\nAccept: */*\r\n" }
      let(:empty_headers) { "\r\n" }

      it 'returns a hash with headers as attributes' do
        expect(RequestParser.parse_headers(headers)).to eq({
          'Host' => 'localhost',
          'Accept' => '*/*'
        })
      end

      it 'returns a empty hash if headers is a \r\n' do
        expect(RequestParser.parse_headers(empty_headers)).to eq({})
      end
    end
  end
end

require 'rails_helper'

RSpec.describe HttpRequestManager do
  describe '#build_response' do
    context 'there is a POST regular action without token but with body' do
      it 'should respond 200' do
        VCR.use_cassette("http_example_request_without_token") do
          username=Clientify::ApiAuth::USERNAME
          password=Clientify::ApiAuth::PASSWORD
          url = "#{Clientify::ApiAuth::CLIENTIFY_URL_API}api-auth/obtain_token/"
          body = "{\n    \"username\": \"#{username}\",\n    \"password\": \"#{password}\"\n}"

          response = HttpRequestManager.new(url, body).build_response(Net::HTTP::Post)
          expect(response.code).to eq('200')
        end
      end
    end

    context 'there is a POST creation action with token and body' do
      it 'should respond 201' do
        VCR.use_cassette "http_example_request_with_token" do
          url = "#{Clientify::ApiAuth::CLIENTIFY_URL_API}contacts/"
          token = 'a7b2a35e8ea5151a084fd5f80479bbdfa0ff0a5c'
          body = "{\n    \"email\": \"vladimir@hoytrabajas.com\",
                    \n    \"tags\": [\"candidate\", \"htweb\"]
                   }"

          response = HttpRequestManager.new(url, body).build_response(Net::HTTP::Post, token)
          expect(response.code).to eq('201')
        end
      end
    end

    context 'there is a GET consult action with token but without body' do
      it 'should respond 200' do
        VCR.use_cassette "http_example_request_with_token" do
          url = "#{Clientify::ApiAuth::CLIENTIFY_URL_API}contacts/"
          token = 'a7b2a35e8ea5151a084fd5f80479bbdfa0ff0a5c'

          response = HttpRequestManager.new(url).build_response(Net::HTTP::Get, token)
          expect(response.code).to eq('200')
        end
      end
    end
  end
end

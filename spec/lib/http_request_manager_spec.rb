require 'rails_helper'

RSpec.describe HttpRequestManager do
  describe '#build_response' do
    context 'there is not token just a http_method to make a login' do
      it 'should respond with a token' do
        url = "https://api.clientify.net/v1/api-auth/obtain_token/"
        body ="{\n    \"username\": \"username\",\n    \"password\": \"pass\"\n}" 
        http_request_manager = HttpRequestManager.new(url, body)
      end
    end
  end
end

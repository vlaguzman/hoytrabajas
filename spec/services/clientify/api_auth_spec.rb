require "rails_helper"

RSpec.describe Clientify::ApiAuth do
  describe "#obtain_token" do
    it "should call to the ClientifyAPI and respond with a token" do
      VCR.use_cassette("clientify_obtain_token") do
        clientify_auth = Clientify::ApiAuth.new
        token = clientify_auth.obtain_token
        expect(token).to eq('a7b2a35e8ea5151a084fd5f80479bbdfa0ff0a5c')
      end
    end
  end
  describe "#logout" do
    it "should close the conection" do
      VCR.use_cassette("clientify_logout") do
      end
    end
  end
end

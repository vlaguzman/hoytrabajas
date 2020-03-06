require "rails_helper"

RSpec.describe Clientify::DataManager do
  describe "#create_contact" do
    expected_main_data = {
      "url"=>"https://api.clientify.net/v1/contacts/7031198/", 
      "id"=>7031198,
      "owner"=>"vladimir@hoytrabajas.com", 
      "owner_name"=>"Vladimir Guzman", 
      "first_name"=>"", 
      "last_name"=>"", 
      "status"=>"cold-lead",
      "title"=>"", 
      "company"=>nil, 
      "company_details"=>nil, 
      "contact_type"=>nil, 
      "contact_source"=>nil, 
      "emails"=>[{"type"=>4, "email"=>"carlos@testemail.com"}], 
      "phones"=>[], 
      "addresses"=>[], 
      "tags"=>["candidate", "htweb"], 
      "description"=>"", 
      "created"=>"2020-03-07T00:06:53.246193+01:00", 
      "last_contact"=>nil
    }

    it "should return a contact created at clientify and its clientify_id" do
      VCR.use_cassette("clientify_create_contact") do 
        user = FactoryBot.create(:user, :first_time_candidate, email: 'carlos@testemail.com')
        clientify_data_manager = Clientify::DataManager.new
        body_response = clientify_data_manager.create_contact user, 'candidate'
        response_hash = JSON.parse body_response.gsub('\:', ':')

        expect(expected_main_data['url']).to eq(response_hash['url'])
        expect(expected_main_data['id']).to eq(response_hash['id'])
        expect(expected_main_data['first_name']).to eq(response_hash['first_name'])
        expect(expected_main_data['last_name']).to eq(response_hash['last_name'])
        expect(expected_main_data['emails']).to eq(response_hash['emails'])
        expect(expected_main_data['tags']).to eq(response_hash['tags'])
        expect(expected_main_data['phones']).to eq(response_hash['phones'])
      end
    end
  end

  describe "#update_contact" do
    expected_main_data = {
      "url"=>"https://api.clientify.net/v1/contacts/7031198/", 
      "id"=>7031198, 
      "owner"=>"vladimir@hoytrabajas.com", 
      "owner_name"=>"Vladimir Guzman", 
      "first_name"=>"carlos", 
      "last_name"=>"valderrama", 
      "status"=>"cold-lead",
      "title"=>"", 
      "company"=>nil, 
      "company_details"=>nil, 
      "contact_type"=>nil, 
      "contact_source"=>nil, 
      "emails"=>[{"type"=>4, "email"=>"carlos@testemail.com"}], 
      "phones"=>[{"phone"=>"317 3729438", "type"=>1}],
      "addresses"=>[], 
      "tags"=>["candidate", "htweb"], 
      "description"=>"", 
      "created"=>"2020-03-07T00:06:53.246193+01:00", 
      "last_contact"=>nil
    }
    it "should return the contact data updated" do
      VCR.use_cassette("clientify_update_contact") do
        user = FactoryBot.create(:user, 
                                 email: 'carlos@testemail.com', 
                                 name: 'carlos', 
                                 last_name: 'valderrama', 
                                 contact_number: '317 3729438', 
                                 clientify_contact_id: '7031198')
        clientify_data_manager = Clientify::DataManager.new
        body_response = clientify_data_manager.update_contact user
        response_hash = JSON.parse body_response.gsub('\:', ':')

        expect(expected_main_data['url']).to eq(response_hash['url'])
        expect(expected_main_data['id']).to eq(response_hash['id'])
        expect(expected_main_data['first_name']).to eq(response_hash['first_name'])
        expect(expected_main_data['last_name']).to eq(response_hash['last_name'])
        expect(expected_main_data['emails']).to eq(response_hash['emails'])
        expect(expected_main_data['tags']).to eq(response_hash['tags'])
        expect(expected_main_data['phones']).to eq(response_hash['phones'])
      end
    end
  end
end

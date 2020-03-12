require "rails_helper"

RSpec.describe Clientify::DataManager do
  describe "#create_contact" do

    expected_main_data = {
      "url"=>"https://api.clientify.net/v1/contacts/7078920/",
      "id"=>7078920,
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
      "emails"=>[{"type"=>4, "email"=>"carlota@testemail.com"}], 
      "phones"=>[], 
      "addresses"=>[], 
      "tags"=>["candidate", "htweb"], 
      "description"=>"", 
      "created"=>"2020-03-07T00:06:53.246193+01:00", 
      "last_contact"=>nil
    }

    expected_main_data_employer = {
      "url"=>"https://api.clientify.net/v1/contacts/7078893/", 
      "id"=>7078893,
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
      "emails"=>[{"type"=>4, "email"=>"company@testemail.com"}], 
      "phones"=>[], 
      "addresses"=>[], 
      "tags"=>["employer", "htweb"], 
      "description"=>"", 
      "created"=>"2020-03-07T00:06:53.246193+01:00", 
      "last_contact"=>nil
    }

    let(:token) { 'a7b2a35e8ea5151a084fd5f80479bbdfa0ff0a5c'}
    let(:clientify_data_manager) { Clientify::DataManager.new(token) }

    context "the user is a candidate" do
      it "should return a contact created at clientify, its clientify_id, and the tag candidate" do
        VCR.use_cassette"clientify_create_candidate_contact" do 
          user = FactoryBot.create(:user, :first_time_candidate, email: 'carlota@testemail.com')
          body_response = clientify_data_manager.create_contact user, 'candidate'
          response_hash = JSON.parse body_response.gsub('\:', ':')
     
          expect(response_hash['url']).to eq(expected_main_data['url'])
          expect(response_hash['id']).to eq(expected_main_data['id'])
          expect(response_hash['first_name']).to eq(expected_main_data['first_name'])
          expect(response_hash['last_name']).to eq(expected_main_data['last_name'])
          expect(response_hash['emails']).to eq(expected_main_data['emails'])
          expect(response_hash['tags']).to eq(expected_main_data['tags'])
          expect(response_hash['phones']).to eq(expected_main_data['phones'])
        end
      end
    end

    context "the user is a employer" do
      it "should return a contact created at clientify, its clientify_id, and the tag employer" do
        VCR.use_cassette "clientify_create_employer_contact" do 
          user = FactoryBot.create(:user, :first_time_candidate, email: 'company@testemail.com')
          body_response = clientify_data_manager.create_contact user, 'employer'
          response_hash = JSON.parse body_response.gsub('\:', ':')
     
          expect(response_hash['url']).to eq(expected_main_data_employer['url'])
          expect(response_hash['id']).to eq(expected_main_data_employer['id'])
          expect(response_hash['first_name']).to eq(expected_main_data_employer['first_name'])
          expect(response_hash['last_name']).to eq(expected_main_data_employer['last_name'])
          expect(response_hash['emails']).to eq(expected_main_data_employer['emails'])
          expect(response_hash['tags']).to eq(expected_main_data_employer['tags'])
          expect(response_hash['phones']).to eq(expected_main_data_employer['phones'])
        end
      end
    end
  end

  describe "#update_contact" do
    expected_main_data = {
      "url"=>"https://api.clientify.net/v1/contacts/7067074/", 
      "id"=>7067074, 
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

    let(:token) { 'a7b2a35e8ea5151a084fd5f80479bbdfa0ff0a5c'}
    let(:clientify_data_manager) { Clientify::DataManager.new(token) }

    it "should return the contact data updated" do
      VCR.use_cassette "clientify_update_contact", record: :new_episodes do
        user = FactoryBot.create(:user, 
                                 email: 'carlos@testemail.com', 
                                 name: 'carlos', 
                                 last_name: 'valderrama', 
                                 contact_number: '317 3729438', 
                                 clientify_contact_id: '7067074')
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

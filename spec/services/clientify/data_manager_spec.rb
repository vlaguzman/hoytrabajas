require "rails_helper"

RSpec.describe Clientify::DataManager do
  describe "#create_contact" do

    expected_main_data = {
      "url"=>"#{Clientify::ApiAuth::CLIENTIFY_URL_API}contacts/7078920/",
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
      "url"=>"#{Clientify::ApiAuth::CLIENTIFY_URL_API}contacts/7078893/",
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
      "url"=>"#{Clientify::ApiAuth::CLIENTIFY_URL_API}contacts/7067074/",
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

    expected_main_data_employer = {
      "url"=>"#{Clientify::ApiAuth::CLIENTIFY_URL_API}contacts/7078893/",
      "id"=>7078893, 
      "owner"=>"vladimir@hoytrabajas.com", 
      "owner_name"=>"Vladimir Guzman", 
      "first_name"=>"Test Company", 
      "last_name"=>"", 
      "status"=>"cold-lead",
      "title"=>"", 
      "company"=>nil, 
      "company_details"=>nil, 
      "contact_type"=>nil, 
      "contact_source"=>nil, 
      "emails"=>[{"type"=>4, "email"=>"company@testemail.com"}], 
      "phones"=>[{"phone"=>"317 3729438", "type"=>1}],
      "addresses"=>[], 
      "tags"=>["employer", "htweb"], 
      "description"=>"", 
      "created"=>"2020-03-07T00:06:53.246193+01:00", 
      "last_contact"=>nil
    }

    let(:token) { 'a7b2a35e8ea5151a084fd5f80479bbdfa0ff0a5c'}
    let(:clientify_data_manager) { Clientify::DataManager.new(token) }

    context "the user is a candidate" do
      it "should return the contact data updated" do
        VCR.use_cassette "clientify_update_contact" do
          user = FactoryBot.create(:user, 
                                   email: 'carlos@testemail.com', 
                                   name: 'carlos', 
                                   last_name: 'valderrama', 
                                   contact_number: '317 3729438', 
                                   clientify_contact_id: '7067074')
          body_response = clientify_data_manager.update_contact user
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

    context "the user is a company" do
      it "should return the contact data updated" do
        VCR.use_cassette "clientify_update_contact_employer" do
          user = FactoryBot.create(:company, 
                                   email: 'company@testemail.com', 
                                   name: 'Test Company', 
                                   contact_cellphone: '317 3729438', 
                                   clientify_contact_id: '7078893')
          body_response = clientify_data_manager.update_contact user
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

  describe "#get_contacts" do
    expected_contacts_data = {
      "count"=>2, 
      "next"=>nil, 
      "previous"=>nil, 
      "results"=>[{
        "url"=>"#{Clientify::ApiAuth::CLIENTIFY_URL_API}contacts/5863851/",
        "id"=>5863851, 
        "owner"=>"camilo@hoytrabajas.com", 
        "owner_name"=>"Andres Camilo Ruiz Diaz", 
        "first_name"=>"camu garaje grill", 
        "last_name"=>"", 
        "status"=>"in-deal", 
        "title"=>"Mesera tiempo completo", 
        "company"=>nil, 
        "emails"=>[{"type"=>4, "email"=>"camugrill@gmail.com"}], 
        "phones"=>[{"type"=>3, "phone"=>"3000778"}], 
        "picture_url"=>nil, 
        "created"=>"2019-11-13T18:21:06.458410+01:00", 
        "last_contact"=>"2019-11-21T17:15:20+01:00"}, 
        {"url"=>"#{Clientify::ApiAuth::CLIENTIFY_URL_API}contacts/5863779/",
         "id"=>5863779, 
         "owner"=>"camilo@hoytrabajas.com", 
         "owner_name"=>"Andres Camilo Ruiz Diaz", 
         "first_name"=>"De raiz", 
         "last_name"=>"", 
         "status"=>"cold-lead", 
         "title"=>"Administrador para punto", 
         "company"=>nil, 
         "emails"=>[{"type"=>4, "email"=>"info@deraiz.com"}], 
         "phones"=>[], 
         "picture_url"=>nil, 
         "created"=>"2019-11-13T17:49:46.359237+01:00", 
         "last_contact"=>"2019-11-13T17:55:51.983498+01:00"}
      ]
    }

    let(:token) { 'a7b2a35e8ea5151a084fd5f80479bbdfa0ff0a5c'}
    let(:clientify_data_manager) { Clientify::DataManager.new(token) }

    context "the contact source is FACEBOOK" do
      it "should return just two contacts" do
        VCR.use_cassette "clientify_get_contact" do
          body_response = clientify_data_manager.get_contacts "Facebook"
          response_hash = JSON.parse body_response.gsub('\:', ':')

          expect(response_hash['count']).to eq(expected_contacts_data['count'])
          expect(response_hash['results'][0]['url']).to eq(expected_contacts_data['results'][0]['url'])
          expect(response_hash['results'][0]['id']).to eq(expected_contacts_data['results'][0]['id'])
          expect(response_hash['results'][0]['first_name']).to eq(expected_contacts_data['results'][0]['first_name'])
          expect(response_hash['results'][1]['url']).to eq(expected_contacts_data['results'][1]['url'])
          expect(response_hash['results'][1]['id']).to eq(expected_contacts_data['results'][1]['id'])
          expect(response_hash['results'][1]['first_name']).to eq(expected_contacts_data['results'][1]['first_name'])
        end
      end
    end
  end

end

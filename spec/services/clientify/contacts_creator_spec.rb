require "rails_helper"

RSpec.describe Clientify::ContactsCreator do
  describe "#call" do

    let(:token) { 'a7b2a35e8ea5151a084fd5f80479bbdfa0ff0a5c'}
    let(:clientify_data_manager) { Clientify::DataManager.new(token) }

    context "there are not any contacts" do
      it "should to receive an empty aswerd and do not do anything" do
        VCR.use_cassette "clientify_contacts_creator_no_contacts", record: :new_episodes do 
          Clientify::ContactsCreator.(token)

          expect(User.count).to eq(0)
          expect(Company.count).to eq(0)
        end
      end
    end

    context "there are one new company contact that is not in the database" do
      it "should to create the company" do
        VCR.use_cassette "clientify_contacts_creator_new_company", record: :new_episodes do 
          
        end
      end
    end

    context "there are just one company contact that is already in the database" do
      it "should not to create the company" do
        VCR.use_cassette "clientify_contacts_creator_new_company", record: :new_episodes do 
          
        end
      end
    end

    context "there are one new candidate contact that is not in the database" do
      it "should to create the user" do
        VCR.use_cassette "clientify_contacts_creator_new_candidate", record: :new_episodes do 
          
        end
      end
    end

    context "there are just new candidate contact that is already in the database" do
      it "should not to create the user" do
        VCR.use_cassette "clientify_contacts_creator_new_candidate", record: :new_episodes do 
          
        end
      end
    end

    context "there are two contcats, one that is new and the other one that already is in the database" do
      it "should save the new contact" do
        VCR.use_cassette "clientify_contacts_creator_one_new_and_one_old_contacts", record: :new_episodes do 
          
        end
      end
    end

    context "there are just contacts that are already saved" do
      it "should validate the contacts and dont save anything" do
        VCR.use_cassette "clientify_contacts_creator_contacts_aldeady_saved", record: :new_episodes do 
          
        end
      end
    end

  end
end

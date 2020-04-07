require "rails_helper"

RSpec.describe Clientify::ContactsCreator do
  describe "#call" do

    let(:token) { 'a7b2a35e8ea5151a084fd5f80479bbdfa0ff0a5c' }
    let(:clientify_data_manager) { Clientify::DataManager.new(token) }

    context "there are not any contacts" do
      it "should to receive an empty aswerd and do not do anything" do
        VCR.use_cassette "clientify_contacts_creator_no_contacts" do 
          Clientify::ContactsCreator.(token, "Google")

          expect(User.count).to eq(0)
          expect(Company.count).to eq(0)
        end
      end
    end

    context "there are one new company contact that is not in the database" do
      it "should to create the company" do
        VCR.use_cassette "clientify_contacts_creator_new_company" do 
          Clientify::ContactsCreator.(token, "HTCLF")

          expect(User.count).to eq(0)
          expect(Company.count).to eq(1)
        end
      end
    end

    context "there are at least one new user contact that is not in the database" do
      it "should to create the user" do
        VCR.use_cassette "clientify_contacts_creator_new_user" do 
          Clientify::ContactsCreator.(token, "Facebook")

          expect(User.count).to eq(1)
          expect(Company.count).to eq(0)
        end
      end
    end

    context "there are just one company contact that is already in the database" do
      it "should not to create the company" do
        VCR.use_cassette "clientify_contacts_creator_new_company" do 
          Company.create!(email: "miltonjmb@gmail.com", password: "12345678", name: "HOYTRABAJAS", contact_name: "Milton")
          expect(Company.count).to eq(1)
          Clientify::ContactsCreator.(token, "HTCLF")

          expect(User.count).to eq(0)
          expect(Company.count).to eq(1)
        end
      end
    end

    context "there are just one user contact that is already in the database" do
      it "should not to create the user" do
        VCR.use_cassette "clientify_contacts_creator_new_user" do 
          User.create!(email: "camugrill@gmail.com", password: "12345678", name: "De raiz")
          expect(User.count).to eq(1)
          Clientify::ContactsCreator.(token, "Facebook")

          expect(User.count).to eq(1)
          expect(Company.count).to eq(0)
        end
      end
    end

  end
end

require 'rails_helper'

RSpec.describe Company, type: :model do
  before { Timecop.freeze(Date.new(2019, 11, 5)) }

  after { Timecop.return }

  describe "validations" do
    it { should respond_to(:name) }
    it { should respond_to(:contact_name) }
    it { should respond_to(:cellphone) }
    it { should respond_to(:contact_cellphone) }
    it { should respond_to(:nit) }
    it { should respond_to(:address) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should respond_to(:web_site) }
    it { should respond_to(:contact_web_site) }
    it { should respond_to(:description) }
    it { should respond_to(:contact_work_position) }
    it { should respond_to(:logo) }

    it { should respond_to(:employees_range_description) }
  end

  context "attachments" do
    subject {  FactoryBot.build(:company).logo }

    it { should be_an_instance_of(ActiveStorage::Attached::One) }
  end

  describe "associoations" do
    it { should have_and_belong_to_many(:users) }
    it { should belong_to(:city) }
    it { should have_many(:offers) }
  end

  describe "#after_confirmation" do
    it {should respond_to(:after_confirmation)}
    it "update confirmed_at field" do
      expect(subject.after_confirmation).to eq(true)
    end
  end

  describe "#state_machine" do
    let!(:company) { create(:company) }
    let!(:offer_1)   { create(:offer, company: company) }
    let!(:offer_2)   { create(:offer, company: company) }

    context "company has two states" do
      context "when company is no_premium" do
        it "should update state to premium" do
          expect(company.state_machine.current_state).to eq("no_premium")
          expect(OfferOnDemand.count).to eq(0)

          company.state_machine.transition_to(:premium)

          offer_on_demand = OfferOnDemand.find_by(offer_id: offer_1.id)

          expect(OfferOnDemand.count).to eq(2)

          expect(company.state_machine.current_state).to eq("premium")
          expect(offer_on_demand.offer).to eq(offer_1)
          expect(offer_on_demand.status).to eq('up')
        end
      end
    end
  end
end

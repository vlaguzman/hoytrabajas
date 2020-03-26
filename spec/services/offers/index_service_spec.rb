require "rails_helper"
include ActionView::Helpers::NumberHelper

RSpec.describe Offers::IndexService do

  let(:offer) { create(:offer, title: "District Facilitator",
      description: "endSint esse anim consequat commodo.",
      created_at: Date.new(2019, 7, 1),
      close_date: Date.new(2019, 7, 3),
      immediate_start: true,
      required_experience: true,
      city: create(:city, description: "Bogotá"),
      company: create(:company, name: "Orellana S.A.")
  ) }

  let(:current_candidate) { create(:user) }

  let(:subject) { described_class.new(offer, current_candidate) }

  let!(:offers_salary) { create(:offer_salary,
    offer: offer,
    from: 1000000,
    to: 5000000,
    salary_period: create(:salary_period, description: "Monthly")
  ) }

  let(:expected_object) do {
    id: offer.id,
    affinity_percentage: nil,
    title: "District Facilitator",
    description: "endSint esse anim consequat commodo.",
    immediate_start: true,
    job_category_image: "https://img-categorias-ht.s3.amazonaws.com/cat-card-gestion-administrativa2x.png",
    required_experience: true,
    on_demand: nil,
    applied_offers:0,
    raw_close_date: Time.zone.local(2019, 7, 3),
    confidential: false,
    city: {
      description: "Bogotá"
    },
    salary: {
      from: "$1,000,000",
      to: "$5,000,000",
      currency: {
        description: "COP"
      },
      salary_period: {
        description: "Monthly"
      }
    },
    company: {
      name: "Orellana S.A.",
      url_image_logo: "https://ht-web-images.s3.amazonaws.com/perfiles/avatar-empresa.png"
    },
    close_date: "03 de Julio del 2019",
    new_offer: false
  } end

  describe "#details" do
    it { should respond_to(:details) }

    it "should return a hash with the required info to show template" do
      expect(subject.details).to eq(expected_object)
    end
  end

  describe "The offer now show the affinity percentage" do
    context "When call the details methods" do

      let(:contract_type) { create(:contract_type, description: "Indefinido")}
      let(:offer_contract)  { create(:empty_offer, contract_type: contract_type, description: 'a description')}

      let(:curriculum_vitae) { create(:curriculum_vitae,
      job_categories: offer_contract.job_categories
      ) }

      let(:user_contract_c) { create(:user,
        :first_time_candidate,
        name: "conan",
        contract_type: contract_type,
        curriculum_vitaes: [curriculum_vitae]
      )}

      let(:subject) { described_class.new(offer_contract, user_contract_c) }

      it "Should include the affinity percentage in text" do
        response = subject.details

        expect(response[:affinity_percentage]).to eq("100%")
      end
    end
  end

end

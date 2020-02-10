require "rails_helper"

RSpec.describe OffersPresenter do
  let(:offer)   { create(:offer) }
  let(:user)    { create(:user) }
  let(:subject) { described_class.new(offer, user) }

  describe "#show_details" do
    it { should respond_to(:show_details) }

    it "should return a hash with the required info to show template" do
      expect(subject.show_details).to be_an_instance_of(Hash)
    end
  end

  describe "#related_offer_show" do
    it { should respond_to(:related_offer_show) }

    it "should return a hash with the required info to show template" do
      expect(subject.related_offer_show).to be_an_instance_of(Array)
    end

    context "when exist 3 related offers" do
      let!(:main_job_category) { create(:job_category, description: "TheMainCategory") }

      let(:main_offer) { create(:offer, job_categories: [main_job_category]) }

      let!(:related_offer_one)   { Offers::IndexService.new(create(:offer, job_categories: [main_job_category])).details }
      let!(:related_offer_two)   { Offers::IndexService.new(create(:offer, job_categories: [main_job_category])).details }
      let!(:related_offer_three) { Offers::IndexService.new(create(:offer, job_categories: [main_job_category])).details }

      let!(:stuff_offers) do
        [create(:offer), create(:offer)]
      end

      let(:subject) { described_class.new(main_offer, user) }

      it "should return 3 expected objects" do
        response = subject.related_offer_show

        expected_response = [
          related_offer_one,
          related_offer_two,
          related_offer_three
        ]

        expect(response.length).to eq(3)
        expect(response).to match_array(expected_response)
      end
    end
  end

  describe "#index_details" do
    it { should respond_to(:index_details) }

    it "should return a array with the required info to show template" do
      response = subject.index_details

      expect(response).to be_an_instance_of(Hash)
    end

    let!(:main_job_category_2) { create(:job_category, description: "TheMainCategory") }
    let!(:related_offer) { create(:offer, job_categories: [main_job_category_2]) }

    it "should have the expected keys in the arrays" do
      response = subject.index_details

      expect(response.keys).to match_array([:applied_offers, :raw_close_date, :affinity_percentage, :id_offer, :city, :close_date, :company, :description, :immediate_start, :job_category_image, :new_offer, :required_experience, :salary, :title, :on_demand])
    end
  end

  describe "#component_translations" do
    it "should return a object used by the react component to build it" do
      response = subject.component_translations

      expect(response).to be_an_instance_of(Hash)

      expected_keys = [
        :first_offer,
        :index,
        :see_offer,
        :affinity,
        :close,
        :aplications,
        :vacancy_numbers,
        :recident,
        :experience,
        :lenguage,
        :type_ofert,
        :work_mode,
        :terms,
        :salary,
        :days,
        :working_day,
        :benefits,
        :transport_aid,
        :employees,
        :contact_company,
        :applied_offer_modal,
        :related_offers,
        :button_disactive,
        :button_active,
        :btn_apply,
        :btn_lg_apply_offer,
        :btn_apply_offer,
        :btn_super_apply,
        :tag_immediate_start,
        :tag_new_offer,
        :tag_without_required_experience,
        :tag_on_demand,
        :candidates
      ]

      expect(response.keys).to match_array(expected_keys)
    end
  end

end

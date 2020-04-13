require "rails_helper"

RSpec.describe OffersPresenter do

  before do
    client = Offer.__elasticsearch__.client = Elasticsearch::Client.new host: "#{ENV['TEST_ELASTICSEARCH_HOST']}:9200"
    Offer.__elasticsearch__.delete_index! if client.indices.exists? index: :offers
    Offer.__elasticsearch__.create_index!
  end

  after do
    client = Offer.__elasticsearch__.client = Elasticsearch::Client.new host: "#{ENV['ELASTICSEARCH_HOST']}:9200"
    Offer.__elasticsearch__.delete_index! if client.indices.exists? index: :offers
    Offer.__elasticsearch__.create_index!
  end

  let!(:offer)   { create(:offer, id: 1313) }
  let(:user)    { create(:user) }
  let(:subject) { described_class.new(offer, current_user: user) }

  describe "#carousal_offers_list", vcr: true do
    let(:subject) { described_class.new(offer, current_user: user, search_parameters: { keywords: offer.title }) }
    it "should return array with card offers attributes" do
      Offer.import

      response = subject.carousal_offers_list

      expect(response.last.keys).to eq([
        :id,
        :title,
        :immediate_start,
        :description,
        :required_experience,
        :confidential,
        :job_category_image,
        :city,
        :salary,
        :company,
        :close_date,
        :on_demand,
        :affinity_percentage,
        :applied_offers,
        :raw_close_date
      ])
    end
  end

  describe "#adtional_title_description" do
    let(:subject) { described_class.new(offer, adtional_title_description: "aditional") }

    it "should return aditional title" do
      response = subject.adtional_title_description

      expect(response).to eq("aditional")
    end
  end

  describe "#meta_tags_builders" do
    it "should return meta tags" do
      response = subject.meta_tags_builders

      expect(response).to eq({:origin=>:default, :content=>nil, :city_name=>offer.city_description})
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

      let!(:related_offer_one)   { Offers::IndexService.new(create(:offer, job_categories: [main_job_category]), user).details }
      let!(:related_offer_two)   { Offers::IndexService.new(create(:offer, job_categories: [main_job_category]), user).details }
      let!(:related_offer_three) { Offers::IndexService.new(create(:offer, job_categories: [main_job_category]), user).details }

      let!(:stuff_offers) do
        [create(:offer), create(:offer)]
      end

      let(:subject) { described_class.new(main_offer, current_user: user) }

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
        :show,
        :candidates
      ]

      expect(response.keys).to match_array(expected_keys)
    end
  end

end

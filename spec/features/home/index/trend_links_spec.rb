require 'rails_helper'

RSpec.describe 'like a user, I want visit the trend links', type: :feature do

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

  describe 'when click in a city trend link', js: true do
    let(:bogota) { create(:city, description: "Bogotá") }
    let!(:offer) { create(:offer, id: 1, title: "Offer of Bogotá", city: bogota) }

    scenario "should be present a link and the offer in the search result" do
      Offer.import

      visit root_path

      find("a.--trendLink", text: "Bogotá").click

      expect(current_path).to eq(offers_path)

      expect(page).to have_content("Offer Of Bogotá")
    end

  end

  describe 'when click in a job category trend link', js: true do
    let(:job_category) { create(:job_category, description: "Cocina, bar y meseros") }
    let!(:offer) { create(:offer, id: 2, title: "Offer of Cocina, bar y meseros", job_categories: [job_category]) }

    scenario "should be present a link and the offer in the search result" do
      Offer.import

      visit root_path

      find("a.--trendLink", text: "Cocina, bar y meseros").click

      expect(current_path).to eq(offers_path)

      expect(page).to have_content("Offer Of Cocina, Bar Y Meseros")
    end

  end

  describe 'when click in a work position trend link', js: true do
    let(:work_position) { create(:work_position, description: "Mensajero") }
    let!(:offer) { create(:offer, id: 3, title: "Offer of Mensajero", work_positions: [work_position]) }

    scenario "should be present a link and the offer in the search result" do
      Offer.import

      visit root_path

      find("a.--trendLink", text: "Mensajero").click

      expect(current_path).to eq(offers_path)

      expect(page).to have_content("Offer Of Mensajero")
    end

  end

  describe 'when click in a contract type trend link', js: true do
    let(:contract_type) { create(:contract_type, description: "Temporal") }
    let!(:offer) { create(:offer, id: 4, title: "Offer of Temporal", contract_type: contract_type) }

    scenario "should be present a link and the offer in the search result" do
      Offer.import

      visit root_path

      find("a.--trendLink", text: "Temporal").click

      expect(current_path).to eq(offers_path)

      expect(page).to have_content("Offer Of Temporal")
    end

  end

  describe 'when click in a working day trend link', js: true do
    let(:working_day) { create(:working_day, description: "Mañana (7am-12pm)") }
    let!(:offer) { create(:offer, id: 5, title: "Offer Of Mañana", working_days: [working_day]) }

    scenario "should be present a link and the offer in the search result" do
      Offer.import

      visit root_path

      find("a.--trendLink", text: "Mañana (7am-12pm)").click

      expect(current_path).to eq(offers_path)

      expect(page).to have_content("Offer Of Mañana")
    end

  end

end
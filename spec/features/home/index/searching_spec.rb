require 'rails_helper'

RSpec.describe 'like a user, I want to search offers', type: :feature do


  describe 'see affinity percentages', js: true do

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

    let!(:developers_category) { create(:job_category, description: "development") }

    let!(:bogota) { create(:city, description: 'Bogota') }

    let!(:offer_ruby) { create(:offer,
      title: 'ruby developer',
      description: "developer with exp in ruby on rails",
      city: bogota,
      job_categories: [developers_category]
    ) }

    let!(:bogota_stuffed_offers) { create_list(:offer, 5, city: bogota) }

    it "should something" do
      Offer.import

      visit root_path

      find("#search_form_keywords").set "ruby"

      find("#combo-box-demo").click
      find("li", text: 'Bogota').click

      find("button.a-buttonFab.--primary.mb-10.search_button.filterForm__searchButton").click

      expect(page).to have_content('Ruby Developer')
      expect(page).to have_content('Developer with exp in ruby on rails')

    end
  end
end
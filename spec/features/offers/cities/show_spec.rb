#encoding: utf-8
require 'rails_helper'

RSpec.describe "Get offers by city from URL", type: :feature do

  before do
    client = Offer.__elasticsearch__.client = Elasticsearch::Client.new host: "#{ENV['TEST_ELASTICSEARCH_HOST']}:9200"
    Offer.__elasticsearch__.delete_index! if client.indices.exists? index: :offers
    Offer.__elasticsearch__.create_index!

    medellin = create(:city, description: 'Medellin')
    la_dorada = create(:city, description: 'La dorada')

    create(:offer, id:1, title: 'Gran Oferta Medellín', city: medellin)
    create(:offer, id:2, title: 'La Dorada Mesero', city: la_dorada)
  end

  after do
    client = Offer.__elasticsearch__.client = Elasticsearch::Client.new host: "#{ENV['ELASTICSEARCH_HOST']}:9200"
    Offer.__elasticsearch__.delete_index! if client.indices.exists? index: :offers
    Offer.__elasticsearch__.create_index!
  end

  describe "Like a user",vcr: true do
    context "When visit the path '/offers/cities/medellin'" do
      it "Should return the the offers in the medellin city", js: true do
        Offer.import

        visit '/offers/cities/medellin'

        expect(page).to have_content('Gran Oferta Medellín')
        expect(page).to_not have_content('La Dorada Mesero')
      end
    end
  end

end
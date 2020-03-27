#encoding: utf-8
require 'rails_helper'

RSpec.describe "get offers by category from URL", type: :feature do

  before do
    client = Offer.__elasticsearch__.client = Elasticsearch::Client.new host: "#{ENV['TEST_ELASTICSEARCH_HOST']}:9200"
    Offer.__elasticsearch__.delete_index! if client.indices.exists? index: :offers
    Offer.__elasticsearch__.create_index!

    support = create(:job_category, description: "Soporte")
    contruction = create(:job_category, description: "contruccion")
    sales = create(:job_category, description: "Ventas")

    create(:offer, id: 1, title: 'Gran Oferta Ventas', job_categories: [support, sales])
    create(:offer, id: 2, title: 'Soporte: Una Super Offerta', job_categories: [support])
    create(:offer, id: 3, title: 'No busques Más Ofertas', job_categories: [contruction])
  end

  after do
    client = Offer.__elasticsearch__.client = Elasticsearch::Client.new host: "#{ENV['ELASTICSEARCH_HOST']}:9200"
    Offer.__elasticsearch__.delete_index! if client.indices.exists? index: :offers
    Offer.__elasticsearch__.create_index!
  end

  describe "Like a user", vcr: true do
    context "When visit the path '/offers/job_categories/soporte'" do
      it "Should return the the offers in the medellin city", js: true do

        Offer.import

        visit '/offers/job_categories/soporte'

        expect(page).to have_content('Gran Oferta Ventas')
        expect(page).to have_content('Soporte: Una Super Offerta')
        expect(page).to_not have_content('No busques Más Ofertas')
      end
    end
  end

end
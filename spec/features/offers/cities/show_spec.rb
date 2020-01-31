#encoding: utf-8
require 'rails_helper'

RSpec.describe "Get offers by city from URL", type: :feature do

  before do
    medellin = create(:city, description: 'Medellin')
    la_dorada = create(:city, description: 'La dorada')

    create(:offer, title: 'Gran Oferta Medellín', city: medellin)
    create(:offer, title: 'La Dorada Mesero', city: la_dorada)
  end


  describe "Like a user" do
    context "When visit the path '/offers/cities/medellin'" do
      it "Should return the the offers in the medellin city", js: true do

        visit '/offers/cities/medellin'

        expect(page).to have_content('Gran Oferta Medellín')
        expect(page).to_not have_content('La Dorada Mesero')
      end
    end
  end

end
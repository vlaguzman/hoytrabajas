require 'rails_helper'

RSpec.describe LanguagesOffers, type: :model do

  describe "associations" do
    it  { should belong_to(:level) }
    it  { should belong_to(:offer) }
    it  { should belong_to(:language) }
  end

  describe "#offer_show_details" do
    it { should respond_to(:offer_show_details) }

    let(:example) do create(
      :languages_offers,
      language: create(:language, description: 'Chinese'),
      level: create(:level, description: 'Low')
      )
    end

    it "should return laguage-level text" do
      expect(example.offer_show_details).to eq('Chinese Low')
    end
  end
end
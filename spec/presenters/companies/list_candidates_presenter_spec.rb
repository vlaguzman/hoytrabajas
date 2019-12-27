require "rails_helper"

RSpec.describe Companies::ListCandidatesPresenter do
  let(:offer) { create(:offer,
    close_date: Date.new(2019, 12, 31),
    city: create(:city, description: 'La Dorada'),
    job_categories: [
      create(:job_category, description: 'Salud'),
      create(:job_category, description: 'Hogar'),
    ]
  ) }

  let!(:applied_offers) { create_list(:applied_offer, 3, offer: offer) }

  let(:subject) { described_class.new(offer) }

  describe "#location" do
    it "should return the city" do
      expect(subject.location).to eq('La Dorada')
    end
  end

  describe "#categories" do
    it "should return the the job categories" do
      expect(subject.categories).to match_array(['Salud', 'Hogar'])
    end
  end

  describe "#pretty_close_date" do
    it "should return pretty close date" do
      expect(subject.pretty_close_date).to eq('31 de Diciembre del 2019')
    end
  end

  describe "#pretty_applied_candidades" do
    it "should return the the job categories" do
      expect(subject.pretty_applied_candidades).to eq('3 Candidato(s)')
    end
  end

end
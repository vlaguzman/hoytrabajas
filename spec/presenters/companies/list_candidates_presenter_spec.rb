require "rails_helper"

RSpec.describe Companies::ListCandidatesPresenter do

  let(:vehicles)     { [create(:vehicle, description: "Moto")] }
  let(:vehicles_b)   { [vehicles.first, create(:vehicle, description: "Carro")] }

  let(:offer) { create(:offer,
    close_date: Date.new(2019, 12, 31),
    city: create(:city, description: 'La Dorada'),
    job_categories: [
      create(:job_category, description: 'Salud'),
      create(:job_category, description: 'Hogar'),
    ],
    vehicles: vehicles
  ) }

  let(:candidate_one_cv)   { create(:user, name: 'Jhonny', last_name: 'Bravo').curriculum_vitae }
  let(:candidate_two_cv)   { create(:user, name: 'Alfred', last_name: 'Ito', vehicles: vehicles_b).curriculum_vitae }
  let(:candidate_three_cv)   { create(:user, name: 'Jon', last_name: 'Snow').curriculum_vitae }

  let!(:applied_offer_1) { create(:applied_offer, curriculum_vitae: candidate_one_cv, offer: offer) }
  let!(:applied_offer_2) { create(:applied_offer, curriculum_vitae: candidate_two_cv, offer: offer) }

  let(:subject) { described_class.new(offer) }

  describe "#location" do
    it "should return the city" do
      expect(subject.location).to eq('La Dorada')
    end
  end

  describe "#categories" do
    it "should return the job categories" do
      expect(subject.categories).to match_array(['Salud', 'Hogar'])
    end
  end

  describe "#pretty_close_date" do
    it "should return pretty close date" do
      expect(subject.pretty_close_date).to eq('31 de Diciembre del 2019')
    end
  end

  describe "#pretty_applied_candidates" do
    it "should return the total candidates that applied" do
      expect(subject.pretty_applied_candidates).to eq('2 Candidato(s)')
    end
  end

  describe "#pretty_not_interested_candidates" do
    it "should return the candidates that were discarded" do
      applied_offer_2.transition_to(:seen)
      applied_offer_2.transition_to(:not_interested)

      expect(subject.pretty_not_interested_candidates).to eq('1 Descartado(s)')
    end
  end

  describe "#list_applied_candidates" do
    context "when has applied offers" do
      it "should return a candidates sort by affinity percentage" do
        affinity_percentages = subject.list_applied_candidates.map { |candidate_info| candidate_info[:affinity_percentage] }

        expect(affinity_percentages).to match_array([27, 0])
      end
    end

    context "when has applied offers with no_interested state" do
      let!(:applied_offer_3) { create(:applied_offer, curriculum_vitae: candidate_three_cv, offer: offer) }

      before do
        applied_offer_3.state_machine.transition_to(:seen)
        applied_offer_3.state_machine.transition_to(:not_interested)
      end
      
      it "should not return applied_offers with not_interested state" do
        expect(subject.list_applied_candidates.count).to match(2)
      end
    end

    context "when has applied offers with same affinity percentage" do
      before do
        candidate_one_cv.user.update(vehicles: vehicles_b)
      end

      it "should return a candidates sort by applied_date" do
        response = subject.list_applied_candidates.map { |candidate_info| [candidate_info[:name], candidate_info[:affinity_percentage]] }

        expect(response).to match_array([['Jhonny Bravo', 27], ['Alfred Ito', 27]])
      end
    end

    context "when has not applied offers" do
      before do
        offer.applied_offers.destroy_all
      end
      scenario "should return an empty array" do
        expect(subject.list_applied_candidates).to match_array([])
      end
    end
  end
end

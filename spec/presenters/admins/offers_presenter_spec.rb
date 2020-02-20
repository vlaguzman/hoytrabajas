require 'rails_helper'

RSpec.describe Admins::OffersPresenter do

  let!(:long_skill)  { create(:technical_skill, description: "this is a very to long description to be presented iug uwu :3") }
  let!(:the_offer)   { create(:offer, technical_skills: [] ) }
  let(:subject)      { described_class.new(the_offer) }

  describe "#get_collection_by_model" do
    context "When the description length is too long" do
      it "Should truncate the description" do
        response = subject.get_collection_by_model(TechnicalSkill)

        expected_response = TechnicalSkill.all.pluck(:id, :description).map { |value| [ value[0], value[1].truncate(30) ] }
        expect(response).to match_array(expected_response)
      end
    end
  end

end

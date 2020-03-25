require "rails_helper"

RSpec.describe Offers::CarousalOffersService::ByAffinityPercentageSorter do

  let!(:curriculum_vitae_candidate) { create(:user).curriculum_vitae }

  let!(:offer_one)   { create(:offer) }
  let!(:offer_two)   { create(:offer) }
  let!(:offer_three) { create(:offer) }
  let!(:offer_four)  { create(:offer) }
  let!(:offer_five)  { create(:offer) }
  let!(:offer_six)   { create(:offer) }

  let!(:applied_offer) { create(:applied_offer, curriculum_vitae: curriculum_vitae_candidate, offer: offer_four) }

  let!(:offer_on_demand) do
    create(:offer_on_demand, offer: offer_two)
    create(:offer_on_demand, offer: offer_five)
  end

  describe "" do
  end

end

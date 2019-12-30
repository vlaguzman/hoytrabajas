require "rails_helper"

RSpec.describe Cities::CitiesWithOffersListService do

  let!(:city_out_the_list) { create(:city, description: 'Sillent Hill') }
  let!(:cities_in_list) do
    [
      create(:city, description: 'Central City'),
      create(:city, description: 'Metropolis')
    ]
  end

  let!(:offer_one) { create(:offer, city: cities_in_list[0]) }
  let!(:offer_two) { create(:offer, city: cities_in_list[1]) }

  describe "#call" do
    context "When a offer is present" do
      it "Should return only the offers cities data" do
        expected_object = [
          {
            label: 'Central City',
            value: cities_in_list[0].id
          },
          {
            label: 'Metropolis',
            value: cities_in_list[1].id
          }
        ]

        response = subject.()

        expect(response).to match_array(expected_object)

      end
    end
  end

end
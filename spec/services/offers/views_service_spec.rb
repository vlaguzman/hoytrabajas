require "rails_helper"
include ActionView::Helpers::NumberHelper

RSpec.describe Offers::ViewsService do

  let(:offer) { create(:offer, title: "District Facilitator",
             description: "endSint esse anim consequat commodo.", 
             created_at: Date.new(2019, 7, 1),
             close_date: Date.new(2019, 7, 3),
             immediate_start: true, 
             required_experience: true, 
	     city: create(:city, description: "Bogotá"),
             company: create(:company, name: "Orellana S.A.")
  ) }

  let(:subject) { described_class.new(offer) }

  let(:offers_salary) { create(:offer_salary,
    offer: offer,
    from: 1000000,
    to: 5000000,
    salary_period: create(:salary_period, description: "Monthly")
  ) }

  let(:expected_object) do {
    id_offer: offer.id, 
    title: "District Facilitator",
    description: "endSint esse anim consequat commodo.",
    immediate_start: true,
    required_experience: true,
    city: {
      description: "Bogotá"
    }, 
    salary: {
      from: "$1,000,000",
      to: "$5,000,000",
      currency: {
        description: "COP"
      },
      salary_period: {
        description: "Monthly"
      }
    },
    company: {
      name: "Orellana S.A."
    },
    close_date: "03 de Agosto del 2019",
  } end

  describe "#details" do
    it { should respond_to(:details) }

    it "should return a hash with the required info to show template" do
      offers_salary
      expect(subject.details).to eq(expected_object)
    end
  end 

end

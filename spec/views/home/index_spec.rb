require 'rails_helper'

RSpec.describe "home/index" do
  before(:each){
    @company = FactoryBot.create(:company)
  }
  context "There are 2 offers" do
    it "Should render home#index template" do
      assign(:offers, [
        create(:offer, title: 'The best offer of your life', company: @company), 
        create(:offer, title: 'one of the best offers', company: @company)
      ])

      render
      
      expect(rendered).to match(/The best offer of your life/)
      expect(rendered).to match(/one of the best offers/)
    end
  end
end

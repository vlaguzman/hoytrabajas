require 'rails_helper'

RSpec.describe "home/index" do

  context "There are 2 offers" do
    let!(:offer)  { create(:offer, title: 'The best offer of your life') }
    let!(:offer2) { create(:offer, title: 'one of the best offers') }

    it "Should render home#index template" do
      assign(:presenter, Home::HomePresenter)

      render

      expect(rendered).to match(/The best offer of your life/)
      expect(rendered).to match(/one of the best offers/)
    end
  end

end

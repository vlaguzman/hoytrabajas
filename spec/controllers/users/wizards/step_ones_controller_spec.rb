require 'rails_helper'

RSpec.describe Users::Wizards::StepOnesController, type: :controller do

  describe "GET users_wizard_step_one#show" do
    let(:candidate) { create(:user, :first_time_candidate) }

    it "should render uusers_wizard_step_one#show template" do
      get :show

      expect(response).to render_template(:show)
    end

    context "When user logs in for the first time" do

      it "should see the  wizard step one to fill candidate data" do
        get :show

        sign_in candidate

        expect(response.status).to eq(200)
        expect(response).to render_template(:show)
      end
    end
  end

end
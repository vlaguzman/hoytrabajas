require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET users#edit" do
    let(:candidate) { create(:user, :first_time_candidate) }

    it "should redner users#edit template" do
      get :edit

      expect(response).to render_template(:edit)
    end

    context "When user logs in for the first time" do

      it "should see the step 1 of fill candidate data wizard" do
        get :edit

        sign_in candidate

        expect(response.status).to eq(200)
      end
    end
  end

end
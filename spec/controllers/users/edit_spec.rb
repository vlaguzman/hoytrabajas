require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET users#edit" do
    let(:candidate) { create(:user) }

    it "should redner users#edit template" do
      sign_in candidate

      get :edit

      expect(response).to render_template(:edit)
    end

    context "When user logs in for the first time" do
      let(:candidate) { create(:user, :first_time_candidate) }

      it "should see the step 1 of fill candidate data wizard" do
        sign_in candidate

        get :edit

        expect(response).to redirect_to(users_wizards_step_one_path)
      end
    end
  end

end
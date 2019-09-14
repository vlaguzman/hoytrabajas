require 'rails_helper'

RSpec.describe Users::Wizards::StepSixController, type: :controller do

  describe "GET users_wizard_step_six#show" do
    before do
      create(:curriculum_vitae, user: create(:user, :first_time_candidate))
    end

    it "should render users_wizard_step_five#show template" do
      get :show

      expect(response).to render_template(:show)
    end

  end

end
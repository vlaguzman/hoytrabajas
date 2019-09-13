require 'rails_helper'

RSpec.describe Users::Wizards::StepTwoController, type: :controller do

  describe "GET users_wizard_step_two#show" do
    let(:candidate) { create(:user, :first_time_candidate) }

    it "should render users_wizard_step_two#show template" do
      sign_in candidate

      get :show

      expect(response.status).to eq(200)
      expect(response).to render_template(:show)
    end

  end

  describe "PUT users_wizard_step_two#update" do
    let(:sex_id) { create(:sex).id }
    let(:ed_id) { create(:educational_degree).id }

    let(:candidate) { create(:user, :first_time_candidate) }

    let(:update_params) do
      { about_me: "",
        sex_id: sex_id,
        birthday: "1990-12-20",
        limitation_ids: [],
        educational_degreed_id: ed_id
      }
    end

    it "should redirect users_wizard_step_three_path" do
      sign_in candidate

      post :update, params:{ user: update_params }

      expect(response.status).to eq(302)
    end

  end

end
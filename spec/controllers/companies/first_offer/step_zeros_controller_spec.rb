require 'rails_helper'

RSpec.describe Companies::FirstOffer::StepZerosController, type: :controller do

  describe "GET companies_ste_step_zero#show" do
    let(:company) { create(:user, :first_time) }

    it "should render companies_ste_step_zero#show template" do
      get :show

      expect(response).to render_template(:show)
    end

  end

end
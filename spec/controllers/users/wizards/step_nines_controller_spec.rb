require 'rails_helper'

RSpec.describe Users::Wizards::StepNinesController, type: :controller do

  describe "GET users_wizard_step_nines#show" do

    it "should render users_wizard_step_nines#show template" do
      get :show

      expect(response).to render_template(:show)
    end

  end

end
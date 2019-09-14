require 'rails_helper'

RSpec.describe "users/wizards/step_sixes/show" do
  it "Should render users/wizards/step_sixes#show template" do

    assign(:user, Users::Wizards::StepSixPresenter.new(create(:user, :first_time_candidate)))

    render

    #title
    expect(rendered).to match(/Déjanos conocer tus habilidades/)


  end
end
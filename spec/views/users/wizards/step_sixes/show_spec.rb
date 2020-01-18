require 'rails_helper'

RSpec.describe "users/wizards/step_sixes/show" do
  it "Should render users/wizards/step_sixes#show template" do

    assign(:curriculum_vitae, Users::Wizards::StepSixPresenter.new(create(:curriculum_vitae)))

    render

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/users/wizards/step_sixes/show"})

  end
end
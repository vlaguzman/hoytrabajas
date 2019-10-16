require 'rails_helper'

RSpec.describe "users/wizards/step_twos/show" do
  it "Should render users/wizards/step_twos#show template" do
    assign(:limitations, [create(:limitation, description: "Ninguna")])
    assign(:educational_degrees, [create(:educational_degree, description: "Profesional")])
    assign(:sexes, [create(:sex, description: "masculino")])
    assign(:user, Users::Wizards::StepTwoPresenter.new(create(:user, :first_time_candidate)))

    render

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/users/wizards/step_twos/show"})
  end
end
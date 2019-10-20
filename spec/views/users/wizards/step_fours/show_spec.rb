require 'rails_helper'

RSpec.describe "users/wizards/step_fours/show" do
  it "Should render users/wizards/step_fours#show template" do
    assign(:states, [
      create(:state),
      create(:state, description: "Bogota"),
    ])

    assign(:cities, [
      create(:city),
      create(:city, description: 'Bogota')
    ])

    assign(:vehicles, [
      create(:vehicle, description: "Carro"),
      create(:vehicle, description: "Moto")
    ])

    assign(:driving_licences, [
      create(:driving_licence, description: "B1"),
      create(:driving_licence, description: "B2")
    ])

    assign(:user, Users::Wizards::StepFourPresenter.new(create(:user, :first_time_candidate)))

    render

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/users/wizards/step_fours/show"})
  end
end
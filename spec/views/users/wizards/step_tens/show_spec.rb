require 'rails_helper'

RSpec.describe "users/wizards/step_tens/show" do
  let(:acknowledgment) { build(:acknowledgment, :empty, curriculum_vitae: create(:curriculum_vitae, :empty)) }

  it "Should render users/wizards/step_tens#show template" do
    assign(:acknowledgment, Users::Wizards::StepTenPresenter.new(acknowledgment))

    render

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/users/wizards/step_tens/show"})


  end
end
require 'rails_helper'

RSpec.describe "users/wizards/step_tens/show" do
  let(:curriculum) { create(:curriculum_vitae, :new_curriculum_vitae, user: create(:user, :first_time_candidate)) }

  it "Should render users/wizards/step_tens#show template" do
    assign(:user, Users::Wizards::StepTenPresenter.new(curriculum.user))

    render

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/users/wizards/step_tens/show"})


  end
end
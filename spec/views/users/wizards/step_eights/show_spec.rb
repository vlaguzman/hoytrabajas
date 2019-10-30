require 'rails_helper'

RSpec.describe "users/wizards/step_eights/show" do
  let(:curriculum) { create(:curriculum_vitae, user: create(:user, :first_time_candidate)) }

  it "Should render users/wizards/step_eights#show template" do

    assign(:user, Users::Wizards::StepEightPresenter.new(curriculum.user))

    render

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/users/wizards/step_eights/show"})

  end
end
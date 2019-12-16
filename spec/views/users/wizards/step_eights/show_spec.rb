require 'rails_helper'

RSpec.describe "users/wizards/step_eights/show" do
  let(:work_experience) { create(:work_experience, curriculum_vitae: create(:curriculum_vitae, :empty)) }

  it "Should render users/wizards/step_eights#show template" do

    assign(:work_experience, Users::Wizards::StepEightPresenter.new(work_experience))

    render

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/users/wizards/step_eights/show"})

  end
end
require 'rails_helper'

RSpec.describe "users/wizards/step_nines/show" do
  let(:curriculum) { create(:curriculum_vitae, :new_curriculum_vitae) }
  it "Should render users/wizards/step_nines#show template" do

    assign(:user, Users::Wizards::StepNinePresenter.new(curriculum.user))

    render

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/users/wizards/step_nines/show"})

  end
end
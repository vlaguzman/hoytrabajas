require 'rails_helper'

RSpec.describe "users/wizards/step_nines/show" do
  let(:educational_level) { create(:educational_level, curriculum_vitae: create(:curriculum_vitae, :empty)) }

  it "Should render users/wizards/step_nines#show template" do

    assign(:educational_level, Users::Wizards::StepNinePresenter.new(educational_level))

    render

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/users/wizards/step_nines/show"})

  end
end
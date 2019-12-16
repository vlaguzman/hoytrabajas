require 'rails_helper'

RSpec.describe "users/wizards/step_elevens/show" do
  let(:curriculum) { create(:curriculum_vitae, :empty, user: create(:user, :first_time_candidate)) }

  it "Should render users/wizards/step_tens#show template" do
    assign(:user, Users::Wizards::StepElevenPresenter.new(curriculum.user))

    render

    expect(rendered).to match(/Has creado un perfil ganador/)
  end
end
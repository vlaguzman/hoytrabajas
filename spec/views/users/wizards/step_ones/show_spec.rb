require 'rails_helper'

RSpec.describe "users/wizards/step_ones/show" do
  it "Should render users/wizards/step_one#edit template" do
    assign(:nationalities, [create(:nationality), create(:nationality)])
    assign(:document_types, [create(:document_type), create(:document_type)])
    assign(:user,  Users::Wizards::StepOnePresenter.new(create(:user, :first_time_candidate)))

    render

    expect(rendered).to match(/Empecemos por conocernos/)

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/users/wizards/step_ones/show"})
  end
end

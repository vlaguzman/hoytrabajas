require 'rails_helper'

RSpec.describe "users/wizards/step_ones/show" do
  it "Should render users/wizards/step_one#edit template" do
    assign(:nationalities, [create(:nationality), create(:nationality)])
    assign(:document_types, [create(:document_type), create(:document_type)])
    assign(:user,  Users::Wizards::StepOnePresenter.new(create(:user, :first_time_candidate)))

    render

    expect(rendered).to match(/Empecemos por conocernos/)

    expect(rendered).to have_tag(:form, with: { id: "step_one" }) do
      with_tag(:input, with: { name: "user[name]", type: "text" })
      with_tag(:input, with: { name: "user[last_name]", type: "text" })
      with_select("user[nationality_ids][]")
      with_select("user[document_type_id]")
      with_submit("siguiente")
    end
  end
end
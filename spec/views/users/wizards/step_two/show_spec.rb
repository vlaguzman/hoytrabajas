require 'rails_helper'

RSpec.describe "users/wizards/step_two/show" do
  it "Should render users/wizards/step_one#show template" do
    assign(:limitations, [create(:limitation, description: "Ninguna")])
    assign(:educational_degrees, [create(:educational_degree, description: "Profesional")])
    assign(:sexes, [create(:sex, description: "masculino")])
    assign(:user, Users::Wizards::StepTwoPresenter.new(create(:user, :first_time_candidate)))

    render

    #title
    expect(rendered).to match(/Empecemos por conocernos/)
    expect(rendered).to match(/Brinda a las empresas información valiosa sobre ti./)

    #form
    expect(rendered).to have_tag(:form, with: { id: "step_two" }) do
      with_tag(:input, with: { name: "user[about_me]", type: "text" })
      with_select("user[sex_id]")
      with_tag(:input, with: { name: "user[birthday]", type: "date" })
      with_select("user[limitation_ids][]")
      with_select("user[educational_degree_id]")

      with_submit("siguiente")
    end
  end
end
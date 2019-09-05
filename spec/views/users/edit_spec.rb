require 'rails_helper'

RSpec.describe "users/edit" do
  it "Should render users#edit template" do
    assign(:user, build(:user, :first_time_candidate))
    assign(:nationalities, [create(:nationality), create(:nationality)])
    assign(:document_types, [create(:document_type), create(:document_type)])

    render

    #title
    expect(rendered).to match(/Empecemos por conocernos/)

    #form
    expect(rendered).to have_tag(:form, with: { id: "update_user" }) do
      with_tag(:input, with: { name: "user[name]", type: "text" })
      with_tag(:input, with: { name: "user[last_name]", type: "text" })
      with_select("user[nationalities][]")
      with_select("user[document_type]")
      with_submit("siguiente")
    end
  end
end
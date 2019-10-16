require 'rails_helper'

RSpec.describe "users/wizards/step_zeros/show.haml" do
  it "displays the welcome message for a new user" do
    render

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/users/wizards/step_zeros/show"})

    expect(rendered).to have_content("El empleado ideal")
    expect(rendered).to have_content("¡si existe!")
    expect(rendered).to have_content("Y crear una oferta atractiva para llegar")
    expect(rendered).to have_content("a el es muy facil ¡vamos a hacerlo!")
  end
end

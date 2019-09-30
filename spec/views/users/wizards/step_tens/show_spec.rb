require 'rails_helper'

RSpec.describe "users/wizards/step_tens/show" do
  it "Should render users/wizards/step_tens#show template" do

    #assign(:user,create(:user, :first_time_candidate))

    render

    #expect(rendered).to render_template(partial: 'shared/_form_errors')

    expect(rendered).to match(/¿Cuentas con reconocimientos?/)
    expect(rendered).to match(/Brinda a las empresas información valiosa sobre ti./)

    expect(rendered).to have_link("Saltar")
    expect(rendered).to have_link("Regresar")

  end
end
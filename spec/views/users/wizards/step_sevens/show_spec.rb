require 'rails_helper'

RSpec.describe "users/wizards/step_sevens/show" do
  it "Should render users/wizards/step_sevens#show template" do

    render

    expect(rendered).to match(/Cuentanos un poco de tu experiencia/)
    expect(rendered).to match(/¿Cuentas con experiencia?/)
    expect(rendered).to have_link("Si, quiero adicionarla", href: users_wizards_step_eight_path)
    expect(rendered).to have_link("No pero con disposición", href: users_wizards_step_nine_path)

    expect(rendered).to have_link("Siguiente", href: users_wizards_step_eight_path)

    expect(rendered).to have_link("Saltar", href: users_wizards_step_nine_path)
    expect(rendered).to have_link("Regresar", href: users_wizards_step_six_path)
  end
end
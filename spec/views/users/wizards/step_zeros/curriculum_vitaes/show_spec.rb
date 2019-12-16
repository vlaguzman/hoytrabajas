require 'rails_helper'

RSpec.describe "users/wizards/step_zeros/curriculum_vitaes/show.haml" do
  it "Page to upload the resume" do
    sign_in create(:user)

    render

    expect(rendered).to have_content("Cuentas con una hoja de vida?")
    expect(rendered).to have_content("Subiendo tu Curriculum podras simplificar el diligenciamiento de tu perfil")
    expect(rendered).to have_field("user[file_cv]")
    expect(rendered).to have_button("Continuar")
  end
end

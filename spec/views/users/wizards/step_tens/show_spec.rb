require 'rails_helper'

RSpec.describe "users/wizards/step_tens/show" do
  let(:curriculum) { create(:curriculum_vitae, :new_curriculum_vitae, user: create(:user, :first_time_candidate)) }

  it "Should render users/wizards/step_tens#show template" do
    assign(:user,curriculum.user)

    render

    expect(rendered).to render_template(partial: 'shared/_form_errors')

    expect(rendered).to match(/¿Cuentas con reconocimientos?/)
    expect(rendered).to match(/Brinda a las empresas información valiosa sobre ti./)

    expect(rendered).to have_tag(:form, with: { id: "step_ten" }) do
      with_tag(:label, text: "Título reconocimiento")

      with_tag(:label, text: "Fecha de inicio")

      with_tag(:label, text: "Institución o entidad")

      with_tag(:label, text: "Arrastra aquí tu diploma")

      with_submit("Publicar")
      with_button("Agregar otro reconocimiento")
    end

    expect(rendered).to have_link("Saltar")
    expect(rendered).to have_link("Regresar")

  end
end
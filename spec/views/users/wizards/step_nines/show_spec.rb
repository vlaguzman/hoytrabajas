require 'rails_helper'

RSpec.describe "users/wizards/step_nines/show" do
  let(:curriculum) { create(:curriculum_vitae, :new_curriculum_vitae) }
  it "Should render users/wizards/step_nines#show template" do

    assign(:user, Users::Wizards::StepNinePresenter.new(curriculum.user))

    render

    expect(rendered).to render_template(partial: 'shared/_form_errors')

    expect(rendered).to match(/Veamos tu formación académica/)
    expect(rendered).to match(/Brinda a las empresas información valiosa sobre ti./)

    expect(rendered).to have_tag(:form, with: { id: "step_nine" }) do
      with_tag(:label, text: "Título educativo*")
      with_tag(:input, with: { name: "user[curriculum_vitae][educational_level][degree]", type: "text" })

      with_tag(:label, text: "Institución")
      with_tag(:input, with: { name: "user[curriculum_vitae][educational_level][institution_name]", type: "text" })

      with_tag(:label, text: "Fecha de inicio")
      with_tag(:input, with: { name: "user[curriculum_vitae][educational_level][start_date]", type: "date" })
      with_tag(:input, with: { name: "user[curriculum_vitae][educational_level][finish_date]", type: "date" })

      with_tag(:label, text: "Estudio en curso")
      with_checkbox("user[curriculum_vitae][educational_level][ongoing_study]", false)

      with_tag(:label, text: "Ubicación")
      with_select("user[curriculum_vitae][educational_level][city_id]")

      with_tag(:label, text: "Arrastra aquí tu diploma")
      with_file_field("user[curriculum_vitae][educational_level][diploma]")

      with_submit("Siguiente")
      with_button("Agregar otro estudio")

    end

    expect(rendered).to have_link("Saltar", href: users_wizards_step_ten_path)
    expect(rendered).to have_link("Regresar", href: users_wizards_step_eight_path)

  end
end
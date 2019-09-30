require 'rails_helper'

RSpec.describe "users/wizards/step_nines/show" do
  it "Should render users/wizards/step_nines#show template" do

    assign(:user, Users::Wizards::StepNinePresenter.new(create(:user, :first_time_candidate)))

    render

    expect(rendered).to render_template(partial: 'shared/_form_errors')

    expect(rendered).to match(/Veamos tu formación académica/)
    expect(rendered).to match(/Brinda a las empresas información valiosa sobre ti./)

    expect(rendered).to have_tag(:form, with: { id: "step_nine" }) do
      with_tag(:label, text: "Título educativo*")

      with_tag(:label, text: "Institución")

      with_tag(:label, text: "Fecha de inicio")

      with_tag(:label, text: "Estudio en curso")

      with_tag(:label, text: "Ubicación")

      with_tag(:label, text: "Ubicación")

      with_submit("Siguiente")
      with_button("Agregar otro estudio")

      #with_select("user[curriculum_vitae][work_experience][job_category_id]")

    end

    expect(rendered).to have_link("Saltar", href: users_wizards_step_ten_path)
    expect(rendered).to have_link("Regresar", href: users_wizards_step_eight_path)

  end
end
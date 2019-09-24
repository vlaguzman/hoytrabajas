require 'rails_helper'

RSpec.describe "users/wizards/step_eights/show" do
  let(:curriculum) { create(:curriculum_vitae, user: create(:user, :first_time_candidate)) }

  it "Should render users/wizards/step_eights#show template" do

    assign(:user, Users::Wizards::StepEightPresenter.new(curriculum.user))

    render

    expect(rendered).to render_template(partial: 'shared/_form_errors')

    expect(rendered).to match(/Cuentanos un poco de tu experiencia/)

    expect(rendered).to have_tag(:form, with: { id: "step_eight" }) do
      with_tag(:label, text: "Úbica tu empleo dentro de una categoría*")
      with_select("user[curriculum_vitae][work_experience][job_category_id]")

      with_tag(:label, text: "Empresa")
      with_tag(:input, with: { name: "user[curriculum_vitae][work_experience][company_name]", type: "text" })

      with_tag(:label, text: "Cargo*")
      with_select("user[curriculum_vitae][work_experience][work_position_id]")

      with_tag(:label, text: "Modalidad de trabajo")
      with_select("user[curriculum_vitae][work_experience][work_methodology_id]")

      with_tag(:label, text: "Ciudad")
      with_select("user[curriculum_vitae][work_experience][city_id]")

      with_tag(:label, text: "Habilidades desempeñadas")
      with_select("user[curriculum_vitae][work_experience][technical_skill_ids][]")

      #TODO uncomment when we use 'localidad'
      #with_tag(:label, text: "Localidad")

      with_tag(:label, text: "Fecha de inicio")
      with_tag(:input, with: { name: "user[curriculum_vitae][work_experience][started_at]", type: "date" })
      with_tag(:input, with: { name: "user[curriculum_vitae][work_experience][finished_at]", type: "date" })

      with_tag(:label, text: "Altualmente laborando")
      with_checkbox("user[curriculum_vitae][work_experience][still_in_progress]", false)

      with_submit("siguiente")
      with_submit("Agregar otra experiencia")
    end

    expect(rendered).to have_link("Saltar", href: users_wizards_step_ten_path)
    expect(rendered).to have_link("Regresar", href: users_wizards_step_seven_path)

  end
end
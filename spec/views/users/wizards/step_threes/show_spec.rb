require 'rails_helper'

RSpec.describe "users/wizards/step_threes/show" do
  it "Should render users/wizards/step_threes#show template" do
    assign(:job_categories, [
      create(:job_category, description: "Marketing"),
      create(:job_category, description: "Tecnologia y Programacion"),
    ])

    assign(:offer_types, [
      create(:offer_type, description: 'Tiempo completo'),
      create(:offer_type, description: 'Medio tiempo')
    ])

    assign(:contract_type, create(:contract_type))
    assign(:work_mode, create(:work_mode))
    assign(:labor_disponibility, create(:labor_disponibility))

    assign(:user, Users::Wizards::StepThreePresenter.new(create(:user, :first_time_candidate)))

    render

    #title
    expect(rendered).to match(/Busquemos las mejores oferta/)
    expect(rendered).to match(/Brinda a las empresas información valiosa sobre ti./)

    #form
    expect(rendered).to have_tag(:form, with: { id: "step_three" }) do
      with_tag(:label, text: "Elije las categorías en las que deseas buscar trabajo")
      with_select("user[curriculum_vitae][job_category_ids][]")

      with_tag(:label, text: "Tipo de oferta")
      with_select("user[curriculum_vitae][offer_type_ids][]")

      with_tag(:label, text: "Acuerdo legal")
      with_select("user[curriculum_vitae][contract_type_id]")

      with_tag(:label, text: "Modalidad de trabajo")
      with_select("user[curriculum_vitae][work_mode_ids][]")

      with_tag(:label, text: "Disponibilidad para trabajar")
      with_select("user[curriculum_vitae][labor_disponibility_id]")

      with_submit("siguiente")
    end
  end
end
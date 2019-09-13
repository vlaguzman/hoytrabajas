require 'rails_helper'

RSpec.describe "users/wizards/step_five/show" do
  it "Should render users/wizards/step_five#show template" do
    assign(:available_work_days, [
      create(:available_work_day, description: 'jueves'),
      create(:available_work_day, description: 'fines de semana'),
    ])

    assign(:working_days, [
      create(:working_day, description: 'Mañana 7am-12pm'),
      create(:working_day, description: 'Noche 10pm-3am'),
    ])

    assign(:salary_periods, [
      create(:salary_period, description: 'Diario'),
      create(:salary_period, description: 'Mensaual'),
    ])

    assign(:currency, create(:currency))

    assign(:user, Users::Wizards::StepFivePresenter.new(create(:user, :first_time_candidate)))

    render

    #title
    expect(rendered).to match(/Busquemos las mejores oferta/)
    expect(rendered).to match(/Brinda a las empresas información valiosa sobre ti./)

    #form
    expect(rendered).to have_tag(:form, with: { id: "step_five" }) do
      with_tag(:label, text: "¿Que días estas disponible para trabajar?")
      with_select("user[curriculum_vitae][available_work_day_ids][]")

      with_tag(:label, text: "Franja horaria")
      with_select("user[curriculum_vitae][working_day_ids][]")

      with_tag(:label, text: "Aspiración salarial*")
      with_select("user[curriculum_vitae][curriculum_vitae_salary][range_type]")

      with_select("user[curriculum_vitae][curriculum_vitae_salary][currency_id]")

      with_tag(:input, with: { name: "user[curriculum_vitae][curriculum_vitae_salary][from]", type: "number" })
      with_tag(:label, text: "a")
      with_tag(:input, with: { name: "user[curriculum_vitae][curriculum_vitae_salary][to]", type: "number" })

      with_tag(:label, text: "Pago")
      with_select("user[curriculum_vitae][curriculum_vitae_salary][salary_period_id]")

      with_submit("siguiente")
    end
  end
end
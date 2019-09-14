require 'rails_helper'

RSpec.describe "users/wizards/step_fours/show" do
  it "Should render users/wizards/step_fours#show template" do
    assign(:states, [
      create(:state),
      create(:state, description: "Bogota"),
    ])

    assign(:cities, [
      create(:city),
      create(:city, description: 'Bogota')
    ])

    assign(:vehicles, [
      create(:vehicle, description: "Carro"),
      create(:vehicle, description: "Moto")
    ])

    assign(:driving_licences, [
      create(:driving_licence, description: "B1"),
      create(:driving_licence, description: "B2")
    ])

    assign(:user, Users::Wizards::StepFourPresenter.new(create(:user, :first_time_candidate)))

    render

    #title
    expect(rendered).to match(/Busquemos las mejores oferta/)
    expect(rendered).to match(/Brinda a las empresas información valiosa sobre ti./)

    #form
    expect(rendered).to have_tag(:form, with: { id: "step_four" }) do
      with_tag(:label, text: "Departamento")
      with_select("states")

      with_tag(:label, text: "Disponibilidad para trabajar en otra ciudades")
      with_checkbox("user[curriculum_vitae][travel_disponibility]", false)

      with_tag(:label, text: "Ciudad")
      with_select("user[city_id]")

      with_tag(:label, text: "Cuentas con algún tipo de vehículo")
      with_select("user[vehicle_ids][]")

      with_tag(:label, text: "Licencia de conducción requerida")
      with_select("user[driving_licence_ids][]")

      with_submit("siguiente")
    end
  end
end
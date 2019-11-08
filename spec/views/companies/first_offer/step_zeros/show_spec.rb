require 'rails_helper'

RSpec.describe "companies/first_offer/step_zeros/show" do
  it "should render step zero template" do
    assign(:company, Companies::FirstOffer::StepZeroPresenter.new(create(:company)))

    render

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/companies/first_offer/step_zeros/show"})

    expect(rendered).to have_content("El empleado ideal")
    expect(rendered).to have_content("¡si existe!")
    expect(rendered).to have_content("Crear tus ofertas con el uso de palabras claves, ")
    expect(rendered).to have_content("que harán el match perfecto con tu empleado ideal.")
  end
end

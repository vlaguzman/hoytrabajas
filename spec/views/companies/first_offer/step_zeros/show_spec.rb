require 'rails_helper'

RSpec.describe "companies/first_offer/step_zeros/show" do
  it "should render step zero template" do
    assign(:company, Companies::FirstOffer::StepZeroPresenter.new(create(:company)))

    render

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/companies/first_offer/step_zeros/show"})

    expect(rendered).to have_content("El empleado ideal")
    expect(rendered).to have_content("¡si existe!")
    expect(rendered).to have_content("Y crear una oferta atractiva para llegar")
    expect(rendered).to have_content("a el es muy facil ¡vamos a hacerlo!")
  end
end

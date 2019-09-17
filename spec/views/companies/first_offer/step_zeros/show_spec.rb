require 'rails_helper'

RSpec.describe "companies/first_offer/step_zeros/show" do
  it "should render step zero template" do
    render

    expect(rendered).to have_content(/El empleado ideal/)
    expect(rendered).to have_content(/¡si existe!/)

    expect(rendered).to have_content(/Y crear una oferta atractiva para llegar/)
    expect(rendered).to have_content(/a el es muy fácil ¡Vamos a hacerlo!/)

    expect(rendered).to have_link("Quiero públicar mi oferta", href: companies_first_offer_step_one_path)
  end
end
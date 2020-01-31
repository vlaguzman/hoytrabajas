require 'rails_helper'

RSpec.describe "users/wizards/step_sevens/show" do
  it "Should render users/wizards/step_sevens#show template" do
    assign(:choices, Users::Wizards::StepSevenPresenter.new(create(:user, :first_time_candidate)))

    render

    expect(rendered).to have_content('Cuentas con experiencia')
    expect(rendered).to have_content('Experiencia o no, lo importante son las ganas de aprender')

    expect(rendered).to have_content('Sí, quiero agregarla')
    expect(rendered).to have_content('No, pero quiero aprender')

    expect(rendered).to have_content('Regresar')
    expect(rendered).to have_content('Omitir')

  end
end
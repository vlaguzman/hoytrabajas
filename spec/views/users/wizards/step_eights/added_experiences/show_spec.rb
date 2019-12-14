require 'rails_helper'

RSpec.describe "users/wizards/step_eights/added_work_experiences/show" do
  let(:added_work_experience) { create(:work_experience,
    company_name: 'Piensa Creativa',
    work_position: create(:work_position, description: 'Community manager'),
    job_category: create(:job_category, description: "Mercadeo y Ventas")
  ) }

  it "Should render users/wizards/step_eights/add_work_experience#show template" do

    assign(:work_experience, Users::Wizards::StepEights::WorkExperiencePresenter.new(added_work_experience))

    render

    expect(rendered).to have_tag('span', text: '¡Perfecto! Hemos registrado tu experiencia')

    expect(rendered).to have_content('Piensa Creativa')
    expect(rendered).to have_content('Responsabilidades')
    expect(rendered).to have_content('Mercadeo y Ventas')

    expect(rendered).to have_content('Agregar más')
    expect(rendered).to have_content('Continuar')
  end
end
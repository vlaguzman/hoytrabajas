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

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/users/wizards/step_threes/show"})
  end
end
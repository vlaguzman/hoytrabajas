require 'rails_helper'

RSpec.describe "users/wizards/step_fives/show" do
  it "Should render users/wizards/step_fives#show template" do
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

    expect(rendered).to have_tag("div", with: { "data-react-class": "views/users/wizards/step_fives/show"})

  end
end
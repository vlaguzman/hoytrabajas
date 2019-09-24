require 'rails_helper'

RSpec.describe "users/wizards/step_nines/show" do
  it "Should render users/wizards/step_nines#show template" do

    assign(:user, Users::Wizards::StepSixPresenter.new(create(:user, :first_time_candidate)))

    render

    expect(rendered).to render_template(partial: 'shared/_form_errors')

    expect(rendered).to match(/Veamos tu información académica/)

  end
end
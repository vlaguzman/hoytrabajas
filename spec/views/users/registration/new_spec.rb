require 'rails_helper'

RSpec.describe "devise/registrations/new" do
  it "should render devise/registrations/new template" do
    assign(:user, create(:user, :first_time_candidate))
    render
    expect(rendered).to match(/Regístrate ahora/)
  end
end  

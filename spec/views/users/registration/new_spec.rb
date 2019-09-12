require 'rails_helper'

RSpec.describe "users/registrations/new" do
  it "should render users/registrations/new template" do
    render
    expect(rendered).to match(/Regístrate ahora/)
  end
end  

require 'rails_helper'

RSpec.describe "users/edit" do
  it "Should render users#edit template" do
    render

    expect(rendered).to match(/Editar Usuario/)
  end
end
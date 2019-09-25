require 'rails_helper'

RSpec.describe "offers/show" do
  it "should render offers show template" do
    render

    expect(rendered).to have_button("Aplicar A Esta Oferta")

end
require 'rails_helper'

RSpec.describe "companies/profiles/show" do
  let!(:company) { create(:company) }

  it "Should render companies/profiles#show template" do
    sign_in company

    render

    expect(rendered).to have_content(company.name)
  end

end

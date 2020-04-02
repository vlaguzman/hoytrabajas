require 'rails_helper'

RSpec.describe "companies/profiles/show" do
  let!(:company) { create(:company, email: 'test@empresa.com') }

  it "Should render companies/profiles#show template" do
    assign(:company, Companies::ProfilesPresenter.new(company))

    sign_in company

    render

    expect(rendered).to have_content(company.name)
  end

end

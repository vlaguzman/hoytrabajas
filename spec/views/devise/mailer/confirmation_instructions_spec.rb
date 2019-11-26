require "rails_helper"

RSpec.describe "devise/mailer/confirmation_instructions" do

  describe "mail confirmation account" do
    let(:user) {create(:user, email: "soypepito@email.com")}

    it "Should render the body in html" do
      assign(:resource, create(:user, email: "soypepito@email.com"))
      render

      expect(rendered).to match(/Bienvenido/)

      expect(rendered).to match(/Confirmar email/)

    end

  end

end

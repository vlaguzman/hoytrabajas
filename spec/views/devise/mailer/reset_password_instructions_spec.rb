require "rails_helper"

RSpec.describe "devise/mailer/reset_password_instructions" do

  describe "mail reset password account for a user" do
    let(:user) {create(:user, email: "soypepito@email.com", name: "pepito")}

    it "Should render the email in html" do
    assign(:resource, user)
    render

    expect(rendered).to match(/¡Siempre Pasa!/)

    expect(rendered).to match("Hola #{user.name}, al parecer haz olvidado tu contrasena")

    expect(rendered).to match(/Restablecer mi contraseña/)

    end

  end

  describe "mail reset password account for a company" do
    let(:company) {create(:company, email: "theboring@company.com", name: "the boring company")}

    it "Should render the email in html" do
    assign(:resource, company)
    render

    expect(rendered).to match(/¡Siempre Pasa!/)

    expect(rendered).to match("Hola #{company.name}, al parecer haz olvidado tu contrasena")

    expect(rendered).to match(/Restablecer mi contraseña/)

    end

  end

end

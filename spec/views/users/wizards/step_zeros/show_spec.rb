require 'rails_helper'

RSpec.describe "users/wizards/step_zeros/show.haml" do
  it "displays the welcome message for a new user" do
    render

    expect(rendered).to have_content(/¡Perfecto!/)
    expect(rendered).to have_content(/Has creado un perfil ganador/)
    expect(rendered).to have_link("Completar mi perfil", href: users_wizards_step_one_path)
  end
end

require 'rails_helper'

RSpec.describe "users/step_zeros/show.html.haml" do
  it "displays the welcome message for a new user" do
    render
    expect(rendered).to have_content("El empleo ideal ¡si existe!")
    expect(rendered).to have_link("Quiero encontrar mi oferta", href: users_wizards_step_one_path)
  end
end

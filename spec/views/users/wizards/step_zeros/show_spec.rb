require 'rails_helper'

RSpec.describe "users/wizards/step_zeros/show.haml" do
  it "displays the welcome message for a new user" do
    render

    expect(rendered).to have_content(/El trabajo ideal/)
    expect(rendered).to have_content(/¡si existe!/)
    expect(rendered).to have_link("Quiero públicar mi oferta", href: users_wizards_step_one_path)
  end
end
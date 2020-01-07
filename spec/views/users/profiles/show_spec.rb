require 'rails_helper'

RSpec.describe "users/profiles/show" do
  let!(:job_category)      { create(:job_category) }
  let!(:educational_level) { create(:educational_level) }
  let!(:work_experience)   { create(:work_experience) }
  let!(:soft_skill)        { create(:soft_skill) }
  let!(:user)              { create(:user, name: 'Sebastian', last_name: 'Castro', email: 'test@test.com', about_me: 'Quis minim aliquip ea tempor reprehenderit voluptate.') }
  let!(:curriculum_vitae)  { create(:curriculum_vitae, user: user, educational_level_ids: [educational_level.id], work_experience_ids: [work_experience.id], job_category_ids: [job_category.id], soft_skill_ids: soft_skill.id) }

  it "Should render users/profiles#show template" do
    curriculum_vitae.file_cv.attach(io: File.open(Rails.root.join('spec', 'factories', 'pdfs', 'diploma.pdf')), filename: 'diploma.pdf')
    assign(:user, Users::ProfilesPresenter.new(user))

    render

    expect(rendered).to have_content("Sebastian")
    expect(rendered).to have_content("Castro")
    expect(rendered).to have_content("test@test.com")
    expect(rendered).to have_content("311 353 5522")
    expect(rendered).to have_link("Descargar Curriculum")

    expect(rendered).to have_content("Sobre mi")
    expect(rendered).to have_content("Quis minim aliquip ea tempor reprehenderit voluptate.")

    expect(rendered).to have_content("Mis intereses")
    expect(rendered).to have_content("Categorias de interes")
    expect(rendered).to have_content(job_category.description)

    expect(rendered).to have_content("Habilidades")
    expect(rendered).to have_content("Habilidades blandas válidas")

    expect(rendered).to have_content("Formación académica")

    expect(rendered).to have_content("Experiencia")

    expect(rendered).to have_content("La manera más fácil, rápida y económica de conseguir empleo.")
  end
end

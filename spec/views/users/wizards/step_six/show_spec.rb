require 'rails_helper'

RSpec.describe "users/wizards/step_six/show" do
  it "Should render users/wizards/step_six#show template" do

    assign(:user, Users::Wizards::StepSixPresenter.new(create(:user, :first_time_candidate)))

    render

    #title
    expect(rendered).to match(/Déjanos conocer tus habilidades/)
    expect(rendered).to match(/Brinda a las empresas información valiosa sobre ti./)

    #form
    expect(rendered).to have_tag(:form, with: { id: "step_six" }) do
      with_tag(:label, text: "Define tres habilidades blandas que destacarías de tu perfil*")
      with_select("user[curriculum_vitae][soft_skill_ids][]")

      with_tag(:label, text: "Define técnicas de acuerdo a tu perfil*")
      with_select("user[curriculum_vitae][curriculum_vitaes_technical_skills][job_category_ids][]")
      with_select("user[curriculum_vitae][curriculum_vitaes_technical_skills][technical_skill_ids][]")
      with_select("user[curriculum_vitae][curriculum_vitaes_technical_skills][level][]")

      with_tag(:label, text: "Define qué habilidades te gustaría aprender o reforzar")
      with_select("user[curriculum_vitae][to_learn_skills][job_category_ids][]")
      with_select("user[curriculum_vitae][to_learn_skills][technical_skill_ids][]")

      with_tag(:label, text: "¿Que idiomas deseas resaltar en tu perfil?")
      with_select("user[curriculum_vitae][curriculum_vitaes_languages][language_id]")
      with_select("user[curriculum_vitae][curriculum_vitaes_languages][level_id]")

      with_submit("siguiente")

    end
  end
end
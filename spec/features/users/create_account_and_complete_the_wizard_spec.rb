require 'rails_helper'

RSpec.describe "Anonymous user create a candidate user account and complete the wizards", type: :feature do
  before do
    #Step_One
    create(:city, description: "Capital Federal", state: create(:state, description: "Buenos Aires", country: create(:country, description: "Argentina")))
    create(:city, description: "Neiva", state: create(:state, description: "Huila", country: create(:country, description: "Colombia")))
    create(:nationality, description: "Colombiana")
    create(:document_type, description: "Cedula de Ciudadania")

    #Step_Two
    create(:sex, description: "Masculino")
    create(:limitation, description: 'Ninguna')
    create(:educational_degree, description: 'Profesional')

    #Step_Three
    create(:job_category, description: 'seguridad')
    create(:job_category, description: 'logistica y transporte')

    create(:offer_type, description: "Tiempo completo")
    create(:offer_type, description: "Medio tiempo")

    create(:contract_type, description: "Indiferente")

    create(:work_mode, description: "Indiferente")
    create(:work_mode, description: "Remoto")

    create(:labor_disponibility, description: "Inmediato")

    #Step_Four
    create(:city, description: "La Dorada",
      state: create(:state, description: "Caldas",
        country: create(:country, description: 'AmericaCountry')
      )
    )

    create(:vehicle, description: "Moto")
    create(:vehicle, description: "Carro")

    create(:driving_licence, description: "B2")
    create(:driving_licence, description: "B1")

    #Step_Five
    create(:available_work_day, description: 'jueves')
    create(:available_work_day, description: 'fines de semana')

    create(:working_day, description: 'Mañana 7am-12pm')
    create(:working_day, description: 'Noche 10pm-3am')

    create(:salary_period, description: 'Diario')
    create(:salary_period, description: 'Mensaual')

    create(:currency)

    #Step Six
    create(:soft_skill, description: "Seeker")
    create(:soft_skill, description: "Archer")

    create(:job_category, description: 'Home and Garden')

    create(:technical_skill, description: "Magichian")
    create(:technical_skill, description: "Warrior")

    create(:language, description: "Spanish")

    create(:level, description: "Expert")

    #Step Eight
    create(:job_category, description: "Sales")
    create(:work_position, description: "Dev RoR")
    create(:work_methodology, description: "Full Time")
    create(:technical_skill, description: "Poo")
    create(:city,
      description: "Neverland City",
      state: create(:state,
        description: 'Stateland',
        country: create(:country, description: 'Neverland')
      )
    )

  end

  let(:current_month) { Time.zone.now.month }

  it "should create register with complete data", js: true do
    visit root_path

  #Sign_Up
    click_on "Registrarme"

    fill_in 'user_email', with: 'nuevousuario@gmail.com'
    fill_in 'user_password', with: 'hola12345'
    fill_in 'user_password_confirmation', with: 'hola12345'

    find('.termsAndConditions__checkbox').click

    has_button?("Registrarme")
    find(".a-button", text: "Registrarme", visible: false).click

  #Step_Zero
    click_on "Quiero completar mi perfil"

  #Upload_cv
    attach_file('user[file_cv]', Rails.root + "spec/factories/pdfs/diploma.pdf", make_visible: true)
    click_button('Continuar')

  #Step_One
    fill_in 'user[name]', with: 'Carlos'
    fill_in 'user[last_name]', with: 'Rojas'

    find("div[id='mui-component-select-user[nationality_ids][]']", visible: false).click
    find("li", text: "Colombiana").click

    find("div[id='mui-component-select-user[born_country_id]", visible: false).click
    sleep 1
    find("li", text: "Argentina").click

    find("div[id='mui-component-select-user[born_state_id]", visible: false).click
    sleep 1
    find("li", text: "Buenos Aires").click

    find("div[id='mui-component-select-user[born_city_id]", visible: false).click
    find("li", text: "Capital Federal").click

    find("div[id='mui-component-select-user[residence_country_id]", visible: false).click
    sleep 1
    find("li", text: "Colombia").click

    find("div[id='mui-component-select-user[residence_state_id]", visible: false).click
    sleep 1
    find("li", text: "Huila").click

    find("div[id='mui-component-select-user[residence_city_id]", visible: false).click
    find("li", text: "Neiva").click

    find("div[id='mui-component-select-user[document_type_id]']", visible: false).click
    find("li", text: "Cedula de Ciudadania").click

    fill_in "user[identification_number]", :with => "1063558224"
    fill_in "user[contact_number]", :with => "3183638789"

    execute_script "window.scrollTo(0, (window.innerHeight * 2) )"
    find("span", text: /SIGUIENTE/).click

  #Step_Two
    fill_in "user[about_me]", :with => "I am the best chef in the world"

    find("div[id='mui-component-select-user[sex_id]']", visible: false).click
    find("li", text: "Masculino").click

    find("input[name='user[birthday]']").click
    find("h6[class='MuiTypography-root MuiPickersToolbarText-toolbarTxt MuiTypography-subtitle1']").click
    find("div[class='MuiTypography-root MuiPickersYear-root MuiTypography-subtitle1']", text:"1995", visible: false).click
    find("p[class='MuiTypography-root MuiTypography-body2 MuiTypography-colorInherit']", text: "27").click
    click_on "OK"

    find("div[id='mui-component-select-user[limitation_ids][]']", visible: false).click
    find("li", text: "Ninguna").click

    find("div[id='mui-component-select-user[educational_degree_id]']", visible: false).click
    find("li", text: "Profesional").click

    find("span", text: /SIGUIENTE/).click

  #Step_Three
    find("div[id='mui-component-select-curriculum_vitae[job_category_ids][]", visible: false).click
    find("li", text: "logistica y transporte").click

    find("div[id='mui-component-select-curriculum_vitae[job_category_ids][]", visible: false).click
    find("li", text: "seguridad").click

    find("div[id='mui-component-select-curriculum_vitae[offer_type_ids][]", visible: false).click
    find("li", text: "Tiempo completo").click

    find("div[id='mui-component-select-curriculum_vitae[offer_type_ids][]", visible: false).click
    find("li", text: "Medio tiempo").click

    find("div[id='mui-component-select-curriculum_vitae[contract_type_id]", visible: false).click
    find("li", text: "Indiferente").click

    find("div[id='mui-component-select-curriculum_vitae[work_mode_ids][]", visible: false).click
    find("li", text: "Indiferente").click

    find("div[id='mui-component-select-curriculum_vitae[work_mode_ids][]", visible: false).click
    find("li", text: "Remoto").click

    find("div[id='mui-component-select-curriculum_vitae[labor_disponibility_id]", visible: false).click
    find("li", text: "Inmediato").click

    find("span", text: /SIGUIENTE/).click

  #Step_Four
    find("span", text: "Disponibilidad para trabajar en otra ciudades").click

    find("div[id='mui-component-select-user[country_id]", visible: false).click
    find("li", text: "AmericaCountry").click

    find("div[id='mui-component-select-user[state_id]", visible: false).click
    find("li", text: "Caldas").click

    find("div[id='mui-component-select-user[city_id]", visible: false).click
    find("li", text: "La Dorada").click

    find("div[id='mui-component-select-user[vehicle_ids][]", visible: false).click
    find("li", text: "Moto").click

    find("div[id='mui-component-select-user[vehicle_ids][]", visible: false).click
    find("li", text: "Carro").click

    find("div[id='mui-component-select-user[driving_licence_ids][]", visible: false).click
    find("li", text: "B2").click

    find("div[id='mui-component-select-user[driving_licence_ids][]", visible: false).click
    find("li", text: "B1").click

    find("span", text: /SIGUIENTE/).click

  #Step_Five
    find("div[id='mui-component-select-curriculum_vitae[available_work_day_ids][]", visible: false).click
    find("li", text: "jueves").click

    find("div[id='mui-component-select-curriculum_vitae[available_work_day_ids][]", visible: false).click
    find("li", text: "fines de semana").click

    find("div[id='mui-component-select-curriculum_vitae[working_day_ids][]", visible: false).click
    find("li", text: "Mañana 7am-12pm").click

    find("div[id='mui-component-select-curriculum_vitae[working_day_ids][]", visible: false).click
    find("li", text: "Noche 10pm-3am").click

    find("div[id='mui-component-select-curriculum_vitae[curriculum_vitae_salary][range_type]", visible: false).click
    find("li", text: "Rango").click

    find("div[id='mui-component-select-curriculum_vitae[curriculum_vitae_salary][currency_id]", visible: false).click
    find("li", text: "COP").click

    fill_in "curriculum_vitae[curriculum_vitae_salary][from]", :with => '4000'
    fill_in "curriculum_vitae[curriculum_vitae_salary][to]", :with => '10000'

    find("div[id='mui-component-select-curriculum_vitae[curriculum_vitae_salary][salary_period_id]", visible: false).click
    find("li", text: "Diario").click

    find("span", text: /SIGUIENTE/).click

  #Step Six
    find("div[id='mui-component-select-curriculum_vitae[soft_skill_ids][]", visible: false).click
    find("li", text: "Seeker").click

    find("div[id='mui-component-select-curriculum_vitae[soft_skill_ids][]", visible: false).click
    find("li", text: "Archer").click

    within "#techicalSkillsRowsWrapper" do
      find("input[name='technical_skill_description']").set('Warrior')

      find('div#mui-component-select-job_category_id').click
    end
    find("li", text: "Home and Garden").click

    within "#techicalSkillsRowsWrapper" do
      find('div#mui-component-select-level_id').click
    end
    find("li", text: "Expert").click

    within "#toLearnSkillsRowsWrapper" do
      find('div#mui-component-select-job_category_id').click
    end
    find("li", text: "Home and Garden").click

    within "#toLearnSkillsRowsWrapper" do
      find("input[name='technical_skill_description']").set('Magichian')
    end

    within "#languagesRowsWrapper" do
      find("div[id='mui-component-select-language_id']", visible: false).click
    end
    find("li", text: "Spanish").click

    within "#languagesRowsWrapper" do
      find("div[id='mui-component-select-level_id']", visible: false).click
    end
    find("li", text: "Expert").click

    find("span", text: /SIGUIENTE/).click

  #Step Seven
    click_on 'Sí, quiero agregarla'

  #Step_Eight
    fill_in "work_experience[company_name]", with: 'Hoy Trabajas'

    find("div[id='mui-component-select-work_experience[job_category_id]']", visible: false).click
    find("li", text: "Sales").click

    find("input[id='work_experience[work_position]']", visible: false).click
    find("li", text: "Dev RoR").click

    find("div[id='mui-component-select-work_experience[work_methodology_id]']", visible: false).click
    find("li", text: "Full Time").click

    find("div[id='mui-component-select-work_experience[country_id]", visible: false).click
    sleep 1
    find("li", text: "Neverland").click
    sleep(2)


    find("div[id='mui-component-select-work_experience[state_id]']", visible: false).click
    sleep 1
    find("li", text: "Stateland").click
    sleep(2)

    find("div[id='mui-component-select-work_experience[city_id]']", visible: false).click
    find("li", text:  "Neverland City").click
    sleep(2)

    find("input[id='work_experience[technical_skills]']", visible: false).click
    find("li", text: "Poo").click

    find("input[name='work_experience[started_at]']").click
    find("h6[class='MuiTypography-root MuiPickersToolbarText-toolbarTxt MuiTypography-subtitle1']").click
    find("div[class='MuiTypography-root MuiPickersYear-root MuiTypography-subtitle1']", text:"2000", visible: false).click
    find("p[class='MuiTypography-root MuiTypography-body2 MuiTypography-colorInherit']", text: "23").click
    click_on "OK"

    find("input[name='work_experience[finished_at]']").click
    find("h6[class='MuiTypography-root MuiPickersToolbarText-toolbarTxt MuiTypography-subtitle1']").click
    find("div[class='MuiTypography-root MuiPickersYear-root MuiTypography-subtitle1']", text:"2010", visible: false).click
    find("p[class='MuiTypography-root MuiTypography-body2 MuiTypography-colorInherit']", text: "12").click
    click_on "OK"

    find("span", text: /CONTINUAR/).click

    visit users_wizards_step_nine_path

  #Step_Nine
    fill_in 'educational_level[degree]', with: 'Supa Engineer'

    fill_in 'educational_level[institution_name]', with: 'MIT'

    find("input[name='educational_level[start_date]']").click
    find("h6[class='MuiTypography-root MuiPickersToolbarText-toolbarTxt MuiTypography-subtitle1']").click
    find("div[class='MuiTypography-root MuiPickersYear-root MuiTypography-subtitle1']", text:"2000", visible: false).click
    find("p[class='MuiTypography-root MuiTypography-body2 MuiTypography-colorInherit']", text: "23").click
    click_on 'OK'

    find("input[name='educational_level[finish_date]']").click
    find("h6[class='MuiTypography-root MuiPickersToolbarText-toolbarTxt MuiTypography-subtitle1']").click
    find("div[class='MuiTypography-root MuiPickersYear-root MuiTypography-subtitle1']", text:"2018", visible: false).click
    find("p[class='MuiTypography-root MuiTypography-body2 MuiTypography-colorInherit']", text: "27").click
    click_on 'OK'

    attach_file("educational_level[diploma]", Rails.root + "spec/factories/pdfs/diploma.pdf" )

    find('span', text: /CONTINUAR/).click

    visit users_wizards_step_ten_path

  #Step_ten
    fill_in 'acknowledgment[title]', with: 'Supa Engineer'

    fill_in 'acknowledgment[entity_name]', with: 'MIT'

    find("input[name='acknowledgment[start_date]']").click
    find("h6[class='MuiTypography-root MuiPickersToolbarText-toolbarTxt MuiTypography-subtitle1']").click
    find("div[class='MuiTypography-root MuiPickersYear-root MuiTypography-subtitle1']", text:"2000", visible: false).click
    find("p[class='MuiTypography-root MuiTypography-body2 MuiTypography-colorInherit']", text: "23").click
    click_on 'OK'

    attach_file("acknowledgment[diploma]", Rails.root + "spec/factories/pdfs/diploma.pdf" )

    find("span", text: /CONTINUAR/).click

    visit users_wizards_step_eleven_path

    find(:button, text: 'Ir al Dashboard').click

    #Expects
    expect(User.count).to eq(1)

    registered_user = User.find_by(email: 'nuevousuario@gmail.com')

  #Step_Zero
    expect(registered_user.curriculum_vitae).to be_present
    expect(registered_user.curriculum_vitaes.count).to eq(1)

  #Step_One
    expect(registered_user.name).to eq('Carlos')
    expect(registered_user.last_name).to eq('Rojas')
    expect(registered_user.document_type.description).to eq('Cedula de Ciudadania')
    expect(registered_user.nationalities.last.description).to eq('Colombiana')
    expect(registered_user.identification_number).to eq('1063558224')
    expect(registered_user.contact_number).to eq('3183638789')

  #Step_Two
    expect(registered_user.about_me).to eq('I am the best chef in the world')
    expect(registered_user.sex.description).to eq('Masculino')
    expect(registered_user.birthday).to eq(Date.new(1995, current_month, 27))
    expect(registered_user.limitations.last.description).to eq('Ninguna')

    cv = registered_user.curriculum_vitae

  #Step_Three
    expect(cv.job_categories.count).to eq(2)
    expect(cv.offer_types.count).to eq(2)
    expect(cv.contract_type.description).to eq("Indiferente")
    expect(cv.work_modes.count).to eq(2)
    expect(cv.labor_disponibility.description).to eq("Inmediato")

  #Step_Four
    expect(cv.travel_disponibility).to be_truthy
    expect(registered_user.vehicles.count).to eq(2)
    expect(registered_user.city.description).to eq("La Dorada")
    expect(registered_user.driving_licences.count).to eq(2)

    salary = cv.curriculum_vitae_salary

  #Step_Five
    expect(cv.available_work_days.count).to eq(2)
    expect(cv.working_days.count).to eq(2)
    expect(salary).to be_present

    expect(salary.from).to eq(4000)
    expect(salary.to).to eq(10000)
    expect(salary.salary_period.description).to eq("Diario")

  #Step Six
    expect(cv.soft_skill_ids.count).to eq(2)
    expect(cv.strong_skills.count).to eq(1)
    expect(cv.to_learn_skills.count).to eq(1)
    expect(cv.strong_languages.count).to eq(1)

  #Step_seven

  #Step_eight
    work_experience = cv.work_experiences.last

    expect(work_experience.company_name).to eq('Hoy Trabajas')
    expect(work_experience.job_category.description).to eq('Sales')
    expect(work_experience.work_position.description).to eq('Dev RoR')
    expect(work_experience.technical_skills.pluck(:description).include?('Poo')).to be_truthy
    expect(work_experience.work_methodology.description).to eq('Full Time')
    expect(work_experience.city.description).to eq('Neverland City')

    expect(work_experience.started_at).to eq(Date.new(2000, Date.today.month, 23))
    expect(work_experience.finished_at).to eq(Date.new(2010, Date.today.month, 12))
    expect(work_experience.still_in_progress).to be_falsy

  #Step_Nine
    added_educational_level = cv.educational_levels.last

    expect(added_educational_level.degree).to eq('Supa Engineer')
    expect(added_educational_level.institution_name).to eq('MIT')
    expect(added_educational_level.start_date).to eq(Date.new(2000, Date.today.month, 23))
    expect(added_educational_level.finish_date).to eq(Date.new(2018, Date.today.month, 27))
    expect(added_educational_level.diploma).to be_present
    expect(added_educational_level.ongoing_study).to be_falsy

  #Step_Ten
    expect(cv.acknowledgments.count).to eq(1)

    added_acknowledgment = cv.acknowledgments.last

    expect(added_acknowledgment.title).to eq('Supa Engineer')
    expect(added_acknowledgment.entity_name).to eq('MIT')
    expect(added_acknowledgment.start_date).to eq(Date.new(2000, Date.today.month, 23))
    expect(added_acknowledgment.diploma).to be_present

    expect(current_path).to eq('/users/dashboard')
  end
end

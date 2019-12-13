require 'rails_helper'

RSpec.describe "Anonymous user create a candidate user account and complete the wizards", :type => :feature do
  before do
    #Step_One
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

    create(:city, description: "La Dorada", state: create(:state, description: "Caldas"))

    create(:vehicle, description: "Moto")
    create(:vehicle, description: "Carro")

    create(:driving_licence, description: "B2")
    create(:driving_licence, description: "B1")

    #Step_Four
    create(:available_work_day, description: 'jueves')
    create(:available_work_day, description: 'fines de semana')

    create(:working_day, description: 'Mañana 7am-12pm')
    create(:working_day, description: 'Noche 10pm-3am')

    create(:salary_period, description: 'Diario')
    create(:salary_period, description: 'Mensaual')

    create(:currency)

  end

  let(:current_month) { Time.zone.now.month }

  it "should create register with complete data", js: true do
    visit root_path

    #Sign_Up
    click_on "SIGN UP CANDIDATO"

    fill_in 'user_email', with: 'nuevousuario@gmail.com'
    fill_in 'user_password', with: 'hola12345'
    fill_in 'user_password_confirmation', with: 'hola12345'
    click_on "Registrarme"

    #Step_Zero
    click_on "Quiero completar mi perfil"

    #Upload_cv
    click_button('Continuar')

    #Step_One
    fill_in 'user[name]', with: 'Carlos'
    fill_in 'user[last_name]', with: 'Rojas'

    find("div[id='mui-component-select-user[nationality_ids][]']", visible: false).click
    find("li", text: "Colombiana").click

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
    find("p[class='MuiTypography-root MuiTypography-body2 MuiTypography-colorInherit']", text: "29").click
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
    find("div[id='mui-component-select-user[state_id]", visible: false).click
    find("li", text: "Caldas").click

    find("span", text: "Disponibilidad para trabajar en otra ciudades").click

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
    expect(registered_user.birthday).to eq(Date.new(1995, current_month, 29))
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

  end
end

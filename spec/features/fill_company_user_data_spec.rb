require 'rails_helper'

RSpec.describe "Fill the principal company user data", :type => :feature do
  let(:company) { FactoryBot.create(:company, :first_time, name: 'HoyTrabjas.com') }

  # let(industry_1) { FactoryBot.create(:industry) }
  # let(industry_2) { FactoryBot.create(:industry) }

  def expected_page_structure
    expect(page).to have_content("Empecemos por conocernos")
    expect(page).to have_content("Brinda a tu candidato información de tu empresa.")

    expect(page).to have_tag(:form, with: { class: "forms__candidate" }) do
      with_tag(:input, with: { name: 'company["name"]', type: "text" })
      with_select('company["industry_id"]')
      with_tag(:input, with: { name: 'company["contact_name"]', type: "text" })
      with_tag(:input, with: { name: 'company["contact_work_position"]', type: "text" })
      with_tag(:input, with: { name: 'company["contact_cellphone"]', type: "text" })
      with_select('company["employees_range_id"]')
    end

    expect(page).to have_link_or_button('Siguiente')
  end

  def fill_form(data)
    fill_in 'company["name"]', :with => data[:name]
    fill_in 'company["industry_id"]', :with => data[:industry_id]
    fill_in 'company["contact_name"]', :with => data[:contact_name]
    fill_in 'company["contact_work_position"]', :with => data[:contact_work_position]
    fill_in 'company["contact_cellphone"]', :with => data[:contact_cellphone]
    fill_in 'company["employees_range_id"]', :with => data[:employees_range_id]
  end

  describe "Company user want register data" do
    context "Data is wrong" do
      it "Fields is required", js: true do
        puts "STARCT *****"
        puts company.inspect
        sign_in company
        puts current_path
        visit companies_first_offer_step_one_path
        puts "la chinita"
        puts current_path
        save_page("daniel.html")

        expected_page_structure
        fill_form(
          {
            name: '',
            industry_id: '',
            contact_name: '',
            contact_work_position: '',
            contact_cellphone: '',
            employees_range_id: ''
          }
        )
        click_link_or_button('Siguiente')

        expect(page).to have_content(/El campo nombre es requerido/)
        expect(page).to have_content(/El campo sector al que pertenece la empresa es requerido/)
      end
    end

    context "Data is correct" do
      scenario "should save succesfully data", js: true do

        visit companies_first_offer_step_one_path

        expected_page_structure(page)
        fill_form(
          {
            name: 'HoyTrabajas.com',
            industry_id: '1',
            contact_name: 'Ruben Cordoba',
            contact_work_position: 'CEO',
            contact_cellphone: '3101234567',
            employees_range_id: '1'
          }
        )
        click_link_or_button('Siguiente')

        company = Company.find_by(name: 'HoyTrabjas.com')

        expect(company.name).to eq('HoyTrabajas.com')
        expect(company.industry_id).to eq('1')
        expect(company.contact_name).to eq('Ruben Cordoba')
        expect(company.contact_work_position).to eq('CEO')
        expect(company.employees_range_id).to eq('1')

        expect(current_path).to eq(companies_first_offer_step_two_path)
        expect(page).to have_text("Describe brevemente tu compañía")
      end
    end

#   context "I already fill the principal info, and i am in the second page" do
#     context "I fill the description field" do
#       scenario "should see the description field and the systems should save in the DB on click the next button" do
#         #Visit the rute of the company profile creation - step 2
#         visit "/empresa/#{user.id}/create_user/step2"

#         expect(page).to have_text("Describe brevemente tu compañía")
#         fill_in "company_abstract", :with => 'Te ayudamos a encontrar el empleo que mejor se adapta a ti.'

#         click_button 'siguiente'
#         #Validate the creation of the company in the DB

#         expect(page).to have_text("Creemos tu primera oferta")
#       end
#     end

#     context "I dont fill the description field" do
#       scenario "should show me the next form with the next button" do
#         #Visit the rute of the company profile creation - step 2
#         visit "/empresa/#{user.id}/create_user/step2"

#         expect(page).to have_text("Describe brevemente tu compañía")

#         click_button 'siguiente'

#         expect(page).to have_text("Creemos tu primera oferta")
#       end
#     end
#   end
  end
end

require 'rails_helper'

RSpec.describe "Fill the principal company user data", :type => :feature do
  let(:company) { FactoryBot.create(:company, :first_time, name: 'HoyTrabajas.com') }

  let!(:industry) { FactoryBot.create(:industry) }

  def expected_page_structure
    expect(page).to have_content("Empecemos por conocernos")
    expect(page).to have_content("Brinda a tu candidato información de tu empresa.")

    expect(page).to have_tag(:form, with: { class: "forms__candidate" }) do
      with_tag(:input, with: { name: 'company["name"]', type: "text" })
      with_tag(:input, with: { name: 'company["industry_id"]', type: "hidden" })
      with_tag(:input, with: { name: 'company["contact_name"]', type: "text" })
      with_tag(:input, with: { name: 'company["contact_work_position"]', type: "text" })
      with_tag(:input, with: { name: 'company["contact_cellphone"]', type: "text" })
      with_tag(:input, with: { name: 'company["employees_range_id"]', type: "hidden" })
    end

    expect(page).to have_button('Siguiente')
  end

  def fill_form(data)
    fill_in 'company["name"]', :with => data[:name]

    find(id: 'select-company["industry_id"]', visible: false).click
    find('li', text: 'Sales').click

    fill_in 'company["contact_name"]', :with => data[:contact_name]
    fill_in 'company["contact_work_position"]', :with => data[:contact_work_position]
    fill_in 'company["contact_cellphone"]', :with => data[:contact_cellphone]

    find(id: 'select-company["employees_range_id"]', visible: false).click
    find('li', text: '1-10').click
  end

  describe "Company user want register data" do
    context "Data is wrong" do
      scenario "Fields is required", js: true do
        sign_in company
        visit companies_first_offer_step_one_path

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

        expect(page).to have_content('El campo nombre es requerido')
      end
    end

    context "Data is correct" do
      scenario "should save succesfully data", js: true do
        sign_in company
        visit companies_first_offer_step_one_path

        expected_page_structure
        fill_form(
          {
            name: 'Enterprise.com',
            contact_name: 'Ruben Cordoba',
            contact_work_position: 'CEO',
            contact_cellphone: '3101234567'
          }
        )
        click_link_or_button('Siguiente')

        company = Company.find_by(name: 'Enterprise.com')

        expect(company.name).to eq('Enterprise.com')
        puts company.inspect
        expect(company.contact_name).to eq('Ruben Cordoba')
        expect(company.contact_work_position).to eq('CEO')

        expect(company.industry_id).to_not be_empty
        expect(company.employees_range_id).to_not be_empty

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

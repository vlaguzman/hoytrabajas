require 'rails_helper'

RSpec.describe "Like an admin", type: :feature do
  include Devise::Test::IntegrationHelpers

  context "when want edit one offer" do

    let!(:offer_type_1)         { create(:offer_type,         description: 'Indifferent') }
    let!(:work_mode_1)          { create(:work_mode,          description: 'Indifferent') }
    let!(:contract_type_1)      { create(:contract_type,      description: 'Indifferent') }
    let!(:city_1)               { create(:city,               description: 'Buenos Aires') }
    let!(:educational_degree_1) { create(:educational_degree, description: 'Proffesional') }
    let!(:job_category_1)       { create(:job_category,       description: 'Programming') }
    let!(:work_position_1)      { create(:work_position,      description: 'Developer') }
    let!(:sex_1)                { create(:sex,                description: 'Male') }
    let!(:currency_1)           { create(:currency,           description: 'COP') }
    let!(:salary_period_1)      { create(:salary_period,      description: 'Biweekly') }
    let!(:available_work_day_1) { create(:available_work_day, description: 'All days') }
    let!(:working_day_1)        { create(:working_day,        description: 'Full time') }
    let!(:job_aid_1)            { create(:job_aid,            description: 'Prestations') }
    let!(:responsibility_1)     { create(:responsibility,     description: 'Indifferent') }
    let!(:requirement_1)        { create(:requirement,        description: 'Indifferent') }
    let!(:vehicle_1)            { create(:vehicle,            description: 'Car') }
    let!(:driving_licence_1)    { create(:driving_licence,    description: 'B(2)') }
    let!(:duration_type_1)      { create(:duration_type,      description: 'DT 1') }
    let!(:technical_skill_1)    { create(:technical_skill,    description: 'TS 1') }
    let!(:language_1)           { create(:language,           description: 'English') }
    let!(:level_1)              { create(:level,              description: 'Basic') }

    let!(:offer_type_2)         { create(:offer_type,         description: 'Work by week') }
    let!(:work_mode_2)          { create(:work_mode,          description: 'Home office') }
    let!(:contract_type_2)      { create(:contract_type,      description: 'Temporal') }
    let!(:city_2)               { create(:city,               description: 'Bogota D.C') }
    let!(:educational_degree_2) { create(:educational_degree, description: 'Master') }
    let!(:job_category_2)       { create(:job_category,       description: 'Computation') }
    let!(:work_position_2)      { create(:work_position,      description: 'Tester') }
    let!(:sex_2)                { create(:sex,                description: 'Female') }
    let!(:available_work_day_2) { create(:available_work_day, description: 'Weekend') }
    let!(:working_day_2)        { create(:working_day,        description: 'Morning') }
    let!(:job_aid_2)            { create(:job_aid,            description: 'Transport aux') }
    let!(:responsibility_2)     { create(:responsibility,     description: 'Indifferent') }
    let!(:requirement_2)        { create(:requirement,        description: 'Indifferent') }
    let!(:vehicle_2)            { create(:vehicle,            description: 'Motocycle') }
    let!(:driving_licence_2)    { create(:driving_licence,    description: 'A(2)') }
    let!(:duration_type_2)      { create(:duration_type,      description: 'DT 2') }
    let!(:technical_skill_2)    { create(:technical_skill,    description: 'TS 2') }
    let!(:language_2)           { create(:language,           description: 'French') }
    let!(:level_2)              { create(:level,              description: 'Avanced') }

    let!(:offers_technical_skill) { create(:offers_technical_skills, offer_id: offer.id, technical_skill_id: technical_skill_1.id, level_id: level_1.id) }
    let!(:language_offer)         { create(:languages_offers, offer_id: offer.id, language_id: language_1.id, level_id: level_1.id) }

    let!(:offer) { create(:offer,
      title:                  'Offer for great devs!',
      offer_type_id:          offer_type_1.id,
      work_mode_id:           work_mode_1.id,
      contract_type_id:       contract_type_1.id,
      city_id:                city_1.id,
      educational_degree_id:  educational_degree_1.id,
      job_category_ids:       [job_category_1.id],
      work_position_ids:      [work_position_1.id],
      sex_ids:                [sex_1.id],
      available_work_day_ids: [available_work_day_1.id],
      working_day_ids:        [working_day_1.id],
      job_aid_ids:            [job_aid_1.id],
      responsibility_ids:     [responsibility_1.id],
      requirement_ids:        [requirement_1.id],
      vehicle_ids:            [vehicle_1.id],
      driving_licence_ids:    [driving_licence_1.id],
    ) }

    before do
      sign_in FactoryBot.create(:admin_user)
      visit admin_dashboard_path
      expect(page).to have_content("Active Admin")

      has_button?("Offers")
      click_on("Offers")

      expect(page).to have_content("Offer for great devs!")

      within "#offer_#{offer.id}" do
        has_button?("Ver")
        has_button?("Eliminar")
        has_button?("Editar")

        click_on("Editar")
      end
    end

    context "when click's on Go back" do
      scenario "should redirect to index of offers" do
        click_link("Regresar")

        expect(current_path).to eq(admin_offers_path)
      end
    end

    context "when fill form with correct data" do
      scenario "the admin select an offer and edit all the data and save succesfully" do
        save_page("daniel.html")
        expect(current_path).to eq(edit_admins_offer_path(offer.id))
        expect(page).to have_content("Editar la oferta: #{offer.title}")

        expect(page).to have_tag(:form, with: { id: "edit_offer_#{offer.id}" }) do
          with_tag(:input,    with: { name: 'offer[id]',                 type: 'hidden'})
          with_tag(:input,    with: { name: 'offer[title]',              type: 'text'})
          with_tag(:textarea, with: { name: 'offer[description]'})
          with_tag(:input,    with: { name: 'offer[vacancies_quantity]',  type: 'number'})
          with_tag(:input,    with: { name: 'offer[vacancies_quantity]',  type: 'number'})
          with_tag(:input,    with: { name: 'offer[close_date]',          type: 'date'})
          with_tag(:input,    with: { name: 'offer[immediate_start]',     type: 'hidden'})
          with_tag(:input,    with: { name: 'offer[required_experience]', type: 'hidden'})
          with_tag(:select,   with: { name: 'offer[status]'})

          with_tag(:input, with: { name: 'offer[age_range][from]',     type: 'number'})
          with_tag(:input, with: { name: 'offer[age_range][to]',       type: 'number'})

          with_tag(:input,  with: { name: 'offer[offer_salary][from]',     type: 'number'})
          with_tag(:input,  with: { name: 'offer[offer_salary][to]',       type: 'number'})
          with_tag(:input,  with: { name: 'offer[offer_salary][is_range]', type: 'hidden'})
          with_tag(:select, with: { name: 'offer[offer_salary][currency_id]'})
          with_tag(:select, with: { name: 'offer[offer_salary][salary_period_id]'})

          with_tag(:select, with: { name: 'offer[offers_technical_skills][][technical_skill_id]'})
          with_tag(:select, with: { name: 'offer[offers_technical_skills][][level_id]'})

          with_tag(:select, with: { name: 'offer[languages_offers][][language_id]'})
          with_tag(:select, with: { name: 'offer[languages_offers][][level_id]'})

          with_tag(:select, with: { name: 'offer[offer_type_id]'})
          with_tag(:select, with: { name: 'offer[work_mode_id]'})
          with_tag(:select, with: { name: 'offer[contract_type_id]'})
          with_tag(:select, with: { name: 'offer[city_id]'})
          with_tag(:select, with: { name: 'offer[educational_degree_id]'})

          with_tag(:input, with: { id: "offer_job_categories_#{job_category_1.id}"})
          with_tag(:input, with: { id: "offer_job_categories_#{job_category_2.id}"})
          with_tag(:input, with: { id: "offer_work_positions_#{work_position_1.id}"})
          with_tag(:input, with: { id: "offer_work_positions_#{work_position_2.id}"})
          with_tag(:input, with: { id: "offer_sexes_#{sex_1.id}"})
          with_tag(:input, with: { id: "offer_sexes_#{sex_2.id}"})
          with_tag(:input, with: { id: "offer_available_work_days_#{available_work_day_1.id}"})
          with_tag(:input, with: { id: "offer_available_work_days_#{available_work_day_2.id}"})
          with_tag(:input, with: { id: "offer_working_days_#{working_day_1.id}"})
          with_tag(:input, with: { id: "offer_working_days_#{working_day_2.id}"})
          with_tag(:input, with: { id: "offer_job_aids_#{job_aid_1.id}"})
          with_tag(:input, with: { id: "offer_job_aids_#{job_aid_2.id}"})
          # TODO uncomment when responsibilities and requirements has been defined
          #with_tag(:input, with: { id: "offer_responsibilities_#{responsibility_1.id}"})
          #with_tag(:input, with: { id: "offer_responsibilities_#{responsibility_2.id}"})
          #with_tag(:input, with: { id: "offer_requirements_#{requirement_1.id}"})
          #with_tag(:input, with: { id: "offer_requirements_#{requirement_2.id}"})
          with_tag(:input, with: { id: "offer_vehicles_#{vehicle_1.id}"})
          with_tag(:input, with: { id: "offer_vehicles_#{vehicle_2.id}"})
          with_tag(:input, with: { id: "offer_driving_licences_#{driving_licence_1.id}"})
          with_tag(:input, with: { id: "offer_driving_licences_#{driving_licence_2.id}"})
        end

        within "#edit_offer_#{offer.id}" do
          fill_in 'offer[title]',              with: 'Offer for only devs'
          fill_in 'offer[description]',        with: 'A super Dupper description'
          fill_in 'offer[vacancies_quantity]', with: 2
          fill_in 'offer[close_date]', with: "#{(Time.new + 10.days).strftime('%F')}"
          find(:css, "#offer_immediate_start[value='1']").set(true)
          find(:css, "#offer_required_experience[value='1']").set(true)
          select('active', from: 'offer[status]')

          fill_in 'offer[age_range][from]', with: 750000
          fill_in 'offer[age_range][to]',   with: 750000

          fill_in 'offer[offer_salary][from]', with: 750000
          fill_in 'offer[offer_salary][to]',   with: 750000
          find(:css, "#offer_offer_salary_is_range[value='1']").set(true)
          select("#{currency_1.description}",      from: 'offer_offer_salary_currency_id')
          select("#{salary_period_1.description}", from: 'offer_offer_salary_salary_period_id')

          fill_in 'offer[offer_required_experiences][duration]', with: 2
          select("#{duration_type_1.description}", from: 'offer_offer_required_experiences_duration_type_id')

          select("#{technical_skill_2.description}", from: 'offer_offers_technical_skills_technical_skill_id')
          select("#{level_2.description}",           from: 'offer_offers_technical_skills_level_id')

          select("#{language_2.description}", from: 'offer_languages_offers_language_id')
          select("#{level_2.description}",    from: 'offer_languages_offers_level_id')

          select("#{offer_type_2.description}",    from: 'offer_offer_type_id')
          select("#{work_mode_2.description}",     from: 'offer_work_mode_id')
          select("#{contract_type_2.description}", from: 'offer_contract_type_id')
          select("#{city_2.description}",          from: 'offer_city_id')
          select("#{educational_degree_2.description}", from: 'offer_educational_degree_id')

          find(:css, "#offer_job_categories_#{job_category_2.id}[value='#{job_category_2.id}']").set(true)
          find(:css, "#offer_work_positions_#{work_position_2.id}[value='#{work_position_2.id}']").set(true)
          find(:css, "#offer_sexes_#{sex_2.id}[value='#{sex_2.id}']").set(true)
          find(:css, "#offer_available_work_days_#{available_work_day_2.id}[value='#{available_work_day_2.id}']").set(true)
          find(:css, "#offer_working_days_#{working_day_2.id}[value='#{working_day_2.id}']").set(true)
          find(:css, "#offer_job_aids_#{job_aid_2.id}[value='#{job_aid_2.id}']").set(true)
          # TODO uncomment when responsibilities and requirements has been defined
          #find(:css, "#offer_responsibilities_#{responsibility_2.id}[value='#{responsibility_2.id}']").set(true)
          #find(:css, "#offer_requirements_#{requirement_2.id}[value='#{requirement_2.id}']").set(true)
          find(:css, "#offer_vehicles_#{vehicle_2.id}[value='#{vehicle_2.id}']").set(true)
          find(:css, "#offer_driving_licences_#{driving_licence_2.id}[value='#{driving_licence_2.id}']").set(true)

          click_on('Guardar')
        end

        expect(current_path).to eq(admin_offer_path(offer.id))

        offer.reload

        expect(offer.title).to eq('Offer for only devs')
        expect(offer.description).to eq('A super Dupper description')
        expect(offer.vacancies_quantity).to eq(2)
        expect(offer.close_date.strftime("%F")).to eq((Time.new + 10.days).strftime("%F"))
        expect(offer.immediate_start).to be_truthy
        expect(offer.required_experience).to be_truthy
        expect(offer.status).to eq(Offer::OFFER_STATUS[2])

        expect(AgeRange.count).to eq(1)

        expect(offer.age_range_from).to eq(750000)
        expect(offer.age_range_to).to eq(750000)

        expect(OfferSalary.count).to eq(1)

        expect(offer.salary_from).to eq(750000)
        expect(offer.salary_to).to eq(750000)
        expect(offer.salary_is_range).to be_truthy
        expect(offer.salary_period_id).to eq(salary_period_1.id)
        expect(offer.salary_currency_id).to eq(currency_1.id)

        expect(OfferRequiredExperiences.count).to eq(1)

        expect(offer.required_experiences_duration).to eq(2)
        expect(offer.required_experiences_duration_type_id).to eq(duration_type_1.id)

        expect(LanguagesOffers.count).to eq(2)

        language_offer = LanguagesOffers.where(offer_id: offer.id).last

        expect(language_offer.language_id).to eq(language_2.id)
        expect(language_offer.level_id).to eq(level_2.id)

        expect(OffersTechnicalSkills.count).to eq(2)

        offer_technical_skill = OffersTechnicalSkills.where(offer_id: offer.id).last

        expect(offer_technical_skill.technical_skill_id).to eq(technical_skill_2.id)
        expect(offer_technical_skill.level_id).to eq(level_2.id)

        expect(offer.offer_type_id).to eq(offer_type_2.id)
        expect(offer.work_mode_id).to eq(work_mode_2.id)
        expect(offer.contract_type_id).to eq(contract_type_2.id)
        expect(offer.city_id).to eq(city_2.id)
        expect(offer.educational_degree_id).to eq(educational_degree_2.id)

        expect(offer.job_category_ids).to match_array([job_category_1.id, job_category_2.id])
        expect(offer.work_position_ids).to match_array([work_position_1.id, work_position_2.id])
        expect(offer.sex_ids).to match_array([sex_1.id, sex_2.id])
        expect(offer.available_work_day_ids).to match_array([available_work_day_1.id, available_work_day_2.id])
        expect(offer.working_day_ids).to match_array([working_day_1.id, working_day_2.id])
        expect(offer.job_aid_ids).to match_array([job_aid_1.id, job_aid_2.id])
        # TODO uncomment when responsibilities and requirements has been defined
        #expect(offer.responsibility_ids).to match_array([responsibility_1.id, responsibility_2.id])
        #expect(offer.requirement_ids).to match_array([requirement_1.id, requirement_2.id])
        expect(offer.vehicle_ids).to match_array([vehicle_1.id, vehicle_2.id])
        expect(offer.driving_licence_ids).to match_array([driving_licence_1.id, driving_licence_2.id])
      end
    end

    context "when fill form with incorrect data" do
      context "when has errors of offer data attributes" do
        scenario "should return errors of offer attributes" do
          expect(current_path).to eq(edit_admins_offer_path(offer.id))
          expect(page).to have_content("Editar la oferta: #{offer.title}")

          within "#edit_offer_#{offer.id}" do
            fill_in 'offer[title]', with: ''
            fill_in 'offer[description]', with: ''
            fill_in 'offer[vacancies_quantity]', with: '-5'

            click_on('Guardar')
          end

          expect(current_path).to eq(admins_offer_path(offer.id))

          within ".error_messages" do
            expect(page).to have_content("Por favor ingrese un título a la oferta, este campo no puede estar en blanco")
            expect(page).to have_content("El título es muy corto")
            expect(page).to have_content("Por favor ingrese una descripción a la oferta, este campo no puede estar en blanco")
            expect(page).to have_content("La cantidad de vacantes debe ser igual ó mayor a uno(1)")
          end
        end
      end

      context "when admin try save associations" do
        context "when has erros in all associations" do
          scenario "should return an goblal messages error of models associates" do
            within "#edit_offer_#{offer.id}" do
              fill_in 'offer[title]', with: ''

              fill_in 'offer[age_range][from]', with: -750000
              fill_in 'offer[age_range][to]',   with: -750000

              fill_in 'offer[offer_salary][from]', with: -750000
              fill_in 'offer[offer_salary][to]',   with: -750000

              fill_in 'offer[offer_required_experiences][duration]', with: -2

              click_on('Guardar')
            end

            expect(current_path).to eq(admins_offer_path(offer.id))

            expect(page).to have_text('Ha ocurrido un error al guardar Rango de edad')
            expect(page).to have_text('Ha ocurrido un error al guardar Información del salario')
            expect(page).to have_text('Ha ocurrido un error al guardar Información de experiencia')

            expect(page).to have_css('#age_range', text: 'Desde debe ser igual ó mayor a 18')
            expect(page).to have_css('#age_range', text: 'Hasta debe ser igual ó mayor a 18')

            expect(page).to have_css('#offer_salary', text: 'Desde debe ser igual ó mayor a uno(1)')
            expect(page).to have_css('#offer_salary', text: 'Hasta debe ser igual ó mayor a uno(1)')

            expect(page).to have_css('#offer_required_experiences', text: 'Debe ser igual ó mayor a uno(1)')
          end
        end

        context "when try save age range" do
          context "when no entry some value" do
            scenario "should not return error" do
              within "#edit_offer_#{offer.id}" do
                fill_in 'offer[title]', with: ''

                click_on('Guardar')
              end

              expect(current_path).to eq(admins_offer_path(offer.id))

              expect(page).to_not have_text('Ha ocurrido un error al guardar Rango de edad')
            end
          end

          context "when entry incomplete data" do
            scenario "should return an goblal messages error of age range and specific error" do
              within "#edit_offer_#{offer.id}" do
                fill_in 'offer[age_range][from]', with: ''
                fill_in 'offer[age_range][to]',   with: 750000

                click_on('Guardar')
              end

              expect(current_path).to eq(admins_offer_path(offer.id))

              expect(page).to have_text('Ha ocurrido un error al guardar Rango de edad')

              expect(page).to have_css('#age_range', text: 'Desde no puede estar en blanco')
            end
          end
        end

        context "when try save offer salary" do
          context "when no entry some value" do
            scenario "should not return error" do
              within "#edit_offer_#{offer.id}" do
                fill_in 'offer[title]', with: ''

                click_on('Guardar')
              end

              expect(current_path).to eq(admins_offer_path(offer.id))

              expect(page).to_not have_text('Ha ocurrido un error al guardar Información del salario')
            end
          end

          context "when entry incomplete data" do
            scenario "should return an goblal messages error of offer salary and specific error" do
              within "#edit_offer_#{offer.id}" do
                fill_in 'offer[offer_salary][from]', with: -750000
                fill_in 'offer[offer_salary][to]',   with: 750000
                find(:css, "#offer_offer_salary_is_range[value='1']").set(true)
                select("#{currency_1.description}", from: 'offer_offer_salary_currency_id')

                click_on('Guardar')
              end

              expect(current_path).to eq(admins_offer_path(offer.id))

              expect(page).to have_text('Ha ocurrido un error al guardar Información del salario')

              expect(page).to have_css('#offer_salary', text: 'Desde debe ser igual ó mayor a uno(1)')
              expect(page).to have_css('#offer_salary', text: 'Debe seleccionar un periodo de pago')
            end
          end
        end

        context "when try save offer required experiences" do
          context "when no entry some value" do
            scenario "should not return error" do
              within "#edit_offer_#{offer.id}" do
                fill_in 'offer[title]', with: ''

                click_on('Guardar')
              end

              expect(current_path).to eq(admins_offer_path(offer.id))

              expect(page).to_not have_text('Ha ocurrido un error al guardar Información de experiencia')
            end
          end

          context "when entry incomplete data" do
            scenario "should return an goblal messages error of offer required experiences and specific error" do
              within "#edit_offer_#{offer.id}" do
                fill_in 'offer[offer_required_experiences][duration]', with: ''
                select("#{duration_type_1.description}", from: 'offer_offer_required_experiences_duration_type_id')

                click_on('Guardar')
              end

              expect(current_path).to eq(admins_offer_path(offer.id))

              expect(page).to have_text('Ha ocurrido un error al guardar Información de experiencia')

              expect(page).to have_css('#offer_required_experiences', text: 'No puede estar en blanco')
            end
          end
        end

        context "when admin arrives in offers technical skills" do
          context "when want create new offers technical skills" do
            context "when entry complete data" do
              scenario "should save succesfully data" do
                within "#edit_offer_#{offer.id}" do
                  select("#{technical_skill_1.description}", from: 'offer_offers_technical_skills_technical_skill_id')
                  select("#{level_1.description}",           from: 'offer_offers_technical_skills_level_id')

                  click_on('Guardar')
                end

                expect(current_path).to eq(admin_offer_path(offer.id))

                offer.reload

                expect(OffersTechnicalSkills.count).to eq(2)

                offer_technical_skill = OffersTechnicalSkills.where(offer_id: offer.id).last

                expect(offer_technical_skill.technical_skill_id).to eq(technical_skill_1.id)
                expect(offer_technical_skill.level_id).to eq(level_1.id)
              end
            end

            context "when no entry some value" do
              scenario "should not return error" do
                within "#edit_offer_#{offer.id}" do
                  fill_in 'offer[title]', with: ''

                  click_on('Guardar')
                end

                expect(current_path).to eq(admins_offer_path(offer.id))

                expect(page).to_not have_text('Ha ocurrido un error al guardar Habilidades técnicas')
              end
            end

            context "when entry incomplete data" do
              scenario "should return an goblal messages error of offer technical skills and specific error" do
                within "#edit_offer_#{offer.id}" do
                  within "#offers_technical_skills" do
                    select("#{technical_skill_1.description}", from: 'offer_offers_technical_skills_technical_skill_id')
                    select("Seleccione un nivel",              from: 'offer_offers_technical_skills_level_id')
                  end

                  click_on('Guardar')
                end

                expect(current_path).to eq(admins_offer_path(offer.id))

                expect(page).to have_text('Ha ocurrido un error al guardar Habilidades técnicas')

                expect(page).to have_css('#offers_technical_skills', text: 'Debe seleccionar un nivel')
              end
            end
          end

          context "when admin want update one offers technical skills" do
            context "when entry complete data" do
              scenario "should save succesfully data" do
                within "#edit_offer_#{offer.id}" do
                  within "#offers_technical_skill_#{offers_technical_skill.id}" do
                    select("#{technical_skill_2.description}", from: 'offer_offers_technical_skills__technical_skill_id')
                    select("#{level_2.description}",           from: 'offer_offers_technical_skills__level_id')
                  end

                  click_on('Guardar')
                end

                expect(current_path).to eq(admin_offer_path(offer.id))

                offer.reload
                offers_technical_skill.reload

                expect(OffersTechnicalSkills.count).to eq(1)

                expect(offers_technical_skill.technical_skill_id).to eq(technical_skill_2.id)
                expect(offers_technical_skill.level_id).to eq(level_2.id)
              end
            end

            context "when entry incomplete data" do
              scenario "should return an goblal messages error of offer technical skills and specific error" do
                within "#edit_offer_#{offer.id}" do
                  within "#offers_technical_skill_#{offers_technical_skill.id}" do
                    select("Seleccione una habilidad técnica", from: 'offer_offers_technical_skills__technical_skill_id')
                    select("#{level_2.description}", from: 'offer_offers_technical_skills__level_id')
                  end

                  click_on('Guardar')
                end

                expect(current_path).to eq(admins_offer_path(offer.id))

                expect(page).to have_text('Ha ocurrido un error al guardar Habilidades técnicas')

                expect(page).to have_css("#offers_technical_skill_#{offers_technical_skill.id}", text: 'Debe seleccionar una habilidad técnica')
              end
            end
          end
        end

        context "when admin arrives in languages offers" do
          context "when want create new languages offers" do
            context "when entry complete data" do
              scenario "should save succesfully data" do
                within "#edit_offer_#{offer.id}" do
                  select("#{language_2.description}", from: 'offer_languages_offers_language_id')
                  select("#{level_2.description}",    from: 'offer_languages_offers_level_id')

                  click_on('Guardar')
                end

                expect(current_path).to eq(admin_offer_path(offer.id))

                offer.reload

                expect(LanguagesOffers.count).to eq(2)

                language_offer = LanguagesOffers.where(offer_id: offer.id).last

                expect(language_offer.language_id).to eq(language_2.id)
                expect(language_offer.level_id).to eq(level_2.id)
              end
            end

            context "when no entry some value" do
              scenario "should not return error" do
                within "#edit_offer_#{offer.id}" do
                  fill_in 'offer[title]', with: ''

                  click_on('Guardar')
                end

                expect(current_path).to eq(admins_offer_path(offer.id))

                expect(page).to_not have_text('Ha ocurrido un error al guardar Idiomas requeridos')
              end
            end

            context "when entry incomplete data" do
              scenario "should return an goblal messages error of languages offers and specific error" do
                within "#edit_offer_#{offer.id}" do
                  select("#{language_1.description}", from: 'offer_languages_offers_language_id')
                  select("Seleccione un nivel", from: 'offer_languages_offers_level_id')

                  click_on('Guardar')
                end

                expect(current_path).to eq(admins_offer_path(offer.id))

                expect(page).to have_text('Ha ocurrido un error al guardar Idiomas requeridos')

                expect(page).to have_css('#languages_offers', text: 'Debe seleccionar un nivel')
              end
            end
          end

          context "when admin want update one languages offers" do
            context "when entry complete data" do
              scenario "should save succesfully data" do
                within "#edit_offer_#{offer.id}" do
                  within "#language_offer_#{language_offer.id}" do
                    select("#{language_2.description}", from: 'offer_languages_offers__language_id')
                    select("#{level_2.description}",    from: 'offer_languages_offers__level_id')
                  end

                  click_on('Guardar')
                end

                expect(current_path).to eq(admin_offer_path(offer.id))

                offer.reload
                language_offer.reload

                expect(LanguagesOffers.count).to eq(1)

                expect(language_offer.language_id).to eq(language_2.id)
                expect(language_offer.level_id).to eq(level_2.id)
              end
            end

            context "when entry incomplete data" do
              scenario "should return an goblal messages error of languages offers and specific error" do
                within "#edit_offer_#{offer.id}" do
                  within "#language_offer_#{language_offer.id}" do
                    select("Seleccione un idioma", from: 'offer_languages_offers__language_id')
                    select("#{level_2.description}", from: 'offer_languages_offers__level_id')
                  end

                  click_on('Guardar')
                end

                expect(current_path).to eq(admins_offer_path(offer.id))

                expect(page).to have_text('Ha ocurrido un error al guardar Idiomas requeridos')

                expect(page).to have_css("#language_offer_#{language_offer.id}", text: 'Debe seleccionar un idioma')
              end
            end
          end
        end

        context "when try save job categories" do
          context "when no entry some job category" do
            scenario "should return an error" do
              within "#edit_offer_#{offer.id}" do
                find(:css, "#offer_job_categories_#{job_category_1.id}[value='#{job_category_1.id}']").set(false)
                find(:css, "#offer_job_categories_#{job_category_2.id}[value='#{job_category_2.id}']").set(false)

                click_on('Guardar')
              end

              expect(current_path).to eq(admins_offer_path(offer.id))

              expect(page).to have_text('Por favor seleccione una categoría, este campo es requerido')
            end
          end

          context "when entry complete data" do
            scenario "should save succesfully job category in offer" do
              within "#edit_offer_#{offer.id}" do
                find(:css, "#offer_job_categories_#{job_category_1.id}[value='#{job_category_1.id}']").set(true)
                find(:css, "#offer_job_categories_#{job_category_2.id}[value='#{job_category_2.id}']").set(true)

                click_on('Guardar')
              end

              expect(current_path).to eq(admin_offer_path(offer.id))

              expect(page).to have_text("La oferta #{offer.title} fue actualizada exitosamente!")
            end
          end
        end
      end
    end
  end
end

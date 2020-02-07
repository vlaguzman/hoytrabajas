require 'rails_helper'

RSpec.describe "admins/offers/edit" do

  let!(:offer_type_1)         { create(:offer_type,         description: 'Indifferent') }
  let!(:work_mode_1)          { create(:work_mode,          description: 'Indifferent') }
  let!(:contract_type_1)      { create(:contract_type,      description: 'Indifferent') }
  let!(:city_1)               { create(:city,               description: 'Buenos Aires') }
  let!(:educational_degree_1) { create(:educational_degree, description: 'Proffesional') }
  let!(:job_category_1)       { create(:job_category,       description: 'Programming') }
  let!(:work_position_1)      { create(:work_position,      description: 'Developer') }
  let!(:sex_1)                { create(:sex,                description: 'Male') }
  let!(:available_work_day_1) { create(:available_work_day, description: 'All days') }
  let!(:working_day_1)        { create(:working_day,        description: 'Full time') }
  let!(:job_aid_1)            { create(:job_aid,            description: 'Prestations') }
  let!(:responsibility_1)     { create(:responsibility,     description: 'Indifferent') }
  let!(:requirement_1)        { create(:requirement,        description: 'Indifferent') }
  let!(:vehicle_1)            { create(:vehicle,            description: 'Car') }
  let!(:driving_licence_1)    { create(:driving_licence,    description: 'B(2)') }
  let!(:technical_skill_1)    { create(:technical_skill,    description: 'TS 1') }
  let!(:language_1)           { create(:language,           description: 'English') }
  let!(:level_1)              { create(:level,              description: 'Basic') }

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

  it "should render edit offer form with values corresponding" do

    assign(:offer, Admins::OffersPresenter.new(offer))

    render

    expect(rendered).to match(/Editar la oferta:  Offer for great devs!/)

    expect(rendered).to have_tag(:form, with: { id: "edit_offer_#{offer.id}" }) do
      with_tag(:input,    with: { name: 'offer[id]',                  type: 'hidden'})
      with_tag(:input,    with: { name: 'offer[title]',               type: 'text'})
      with_tag(:textarea, with: { name: 'offer[description]'})
      with_tag(:input,    with: { name: 'offer[vacancies_quantity]',  type: 'number'})
      with_tag(:input,    with: { name: 'offer[close_date]',          type: 'date'})
      with_tag(:input,    with: { name: 'offer[immediate_start]',     type: 'hidden'})
      with_tag(:input,    with: { name: 'offer[required_experience]', type: 'hidden'})
      with_tag(:select,   with: { name: 'offer[status]'})
      with_tag(:input,    with: { name: 'offer[offer_confidential]', type: 'hidden'})

      with_tag(:input, with: { name: 'offer[age_range][from]', type: 'number'})
      with_tag(:input, with: { name: 'offer[age_range][to]',   type: 'number'})

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
  end
end

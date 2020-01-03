require 'rails_helper'

RSpec.describe Admins::OffersService do
  let(:company) { create(:company) }
  let(:offer)   { create(:offer) }

  let!(:offer_type)           { create(:offer_type,         description: 'Indifferent') }
  let!(:work_mode)            { create(:work_mode,          description: 'Indifferent') }
  let!(:contract_type)        { create(:contract_type,      description: 'Indifferent') }
  let!(:city)                 { create(:city,               description: 'Buenos Aires') }
  let!(:educational_degree)   { create(:educational_degree, description: 'Proffesional') }
  let!(:job_category_1)       { create(:job_category,       description: 'Programming') }
  let!(:work_position_1)      { create(:work_position,      description: 'Developer') }
  let!(:sex_1)                { create(:sex,                description: 'Male') }
  let!(:currency)             { create(:currency,           description: 'COP') }
  let!(:salary_period)        { create(:salary_period,      description: 'Biweekly') }
  let!(:available_work_day_1) { create(:available_work_day, description: 'All days') }
  let!(:working_day_1)        { create(:working_day,        description: 'Full time') }
  let!(:job_aid_1)            { create(:job_aid,            description: 'Prestations') }
  let!(:responsibility_1)     { create(:responsibility,     description: 'Indifferent') }
  let!(:requirement_1)        { create(:requirement,        description: 'Indifferent') }
  let!(:vehicle_1)            { create(:vehicle,            description: 'Car') }
  let!(:driving_licence_1)    { create(:driving_licence,    description: 'B(2)') }
  let!(:duration_type)        { create(:duration_type,      description: 'DT 1') }
  let!(:technical_skill)      { create(:technical_skill,    description: 'TS 1') }
  let!(:language)             { create(:language,           description: 'English') }
  let!(:level)                { create(:level,              description: 'Basic') }

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

  it { should be_an_instance_of(Module) }

  describe "#call" do
    context "when all data is correct" do
      let(:params) do
        {
          id:                     offer.id,
          title:                  'Offer for only devs',
          vacancies_quantity:     '2',
          "close_date(1i)"=>      '2020',
          "close_date(2i)"=>      '1',
          "close_date(3i)"=>      '4',
          immediate_start:        '1',
          status:                 'active',
          offer_type_id:          offer_type.id,
          work_mode_id:           work_mode.id,
          contract_type_id:       contract_type.id,
          city_id:                city.id,
          educational_degree_id:  educational_degree.id,
          job_categories:         ["#{job_category_1.id}", "#{job_category_2.id}"],
          work_positions:         ["#{work_position_1.id}", "#{work_position_2.id}"],
          sexes:                  ["#{sex_1.id}", "#{sex_2.id}"],
          available_work_days:    ["#{available_work_day_1.id}", "#{available_work_day_2.id}"],
          working_days:           ["#{working_day_1.id}", "#{working_day_2.id}"],
          job_aids:               ["#{job_aid_1.id}", "#{job_aid_2.id}"],
          responsibilities:       ["#{responsibility_1.id}", "#{responsibility_2.id}"],
          requirements:           ["#{requirement_1.id}", "#{requirement_2.id}"],
          vehicles:               ["#{vehicle_1.id}", "#{vehicle_2.id}"],
          driving_licences:       ["#{driving_licence_1.id}", "#{driving_licence_2.id}"],
          age_range: {
            to:   '750000',
            from: '750000',
            offer_id: offer.id
          },
          offer_salary: {
            to:   '750000',
            from: '750000',
            is_range: '1',
            offer_id: offer.id,
            salary_period_id: salary_period.id,
            currency_id: currency.id
          },
          offer_required_experiences: {
            duration: '2',
            duration_type_id: duration_type.id,
            offer_id: offer.id
          },
          offers_technical_skills: {
            technical_skill_id: technical_skill.id,
            level_id: level.id,
            offer_id: offer.id
          },
          languages_offers: {
            language_id: language.id,
            level_id: level.id,
            offer_id: offer.id
          }
        }
      end

      it "Should return a updated offer" do
        offer = subject.(update_params: params)

        expect(offer[:status]).to eq(:ok)

        expect(offer[:data]).to be_an_instance_of(Offer)

        expect(offer[:data].title).to eq('Offer for only devs')
        expect(offer[:data].vacancies_quantity).to eq(2)
        expect(offer[:data].close_date.strftime("%F")).to eq(Time.new(2020, 01, 4).strftime("%F"))
        expect(offer[:data].immediate_start).to be_truthy
        expect(offer[:data].required_experience).to be_truthy

        expect(AgeRange.count).to eq(1)

        expect(offer[:data].age_range_to).to eq(750000)
        expect(offer[:data].age_range_from).to eq(750000)

        expect(OfferSalary.count).to eq(1)

        expect(offer[:data].salary_to).to eq(750000)
        expect(offer[:data].salary_from).to eq(750000)
        expect(offer[:data].salary_is_range).to be_truthy
        expect(offer[:data].salary_period_id).to eq(salary_period.id)
        expect(offer[:data].salary_currency_id).to eq(currency.id)

        expect(OfferRequiredExperiences.count).to eq(1)

        expect(offer[:data].required_experiences_duration).to eq(2)
        expect(offer[:data].required_experiences_duration_type_id).to eq(duration_type.id)

        expect(LanguagesOffers.count).to eq(1)

        language_offer = LanguagesOffers.where(offer_id: offer[:data].id).first

        expect(language_offer.level_id).to eq(level.id)
        expect(language_offer.language_id).to eq(language.id)

        expect(OffersTechnicalSkills.count).to eq(1)

        offer_technical_skill = OffersTechnicalSkills.where(offer_id: offer[:data].id).first

        expect(offer_technical_skill.technical_skill_id).to eq(technical_skill.id)
        expect(offer_technical_skill.level_id).to eq(level.id)

        expect(offer[:data].offer_type_id).to eq(offer_type.id)
        expect(offer[:data].work_mode_id).to eq(work_mode.id)
        expect(offer[:data].contract_type_id).to eq(contract_type.id)
        expect(offer[:data].city_id).to eq(city.id)
        expect(offer[:data].educational_degree_id).to eq(educational_degree.id)

        expect(offer[:data].job_category_ids).to match_array([job_category_1.id, job_category_2.id])
        expect(offer[:data].work_position_ids).to match_array([work_position_1.id, work_position_2.id])
        expect(offer[:data].sex_ids).to match_array([sex_1.id, sex_2.id])
        expect(offer[:data].available_work_day_ids).to match_array([available_work_day_1.id, available_work_day_2.id])
        expect(offer[:data].working_day_ids).to match_array([working_day_1.id, working_day_2.id])
        expect(offer[:data].job_aid_ids).to match_array([job_aid_1.id, job_aid_2.id])
        expect(offer[:data].responsibility_ids).to match_array([responsibility_1.id, responsibility_2.id])
        expect(offer[:data].requirement_ids).to match_array([requirement_1.id, requirement_2.id])
        expect(offer[:data].vehicle_ids).to match_array([vehicle_1.id, vehicle_2.id])
        expect(offer[:data].driving_licence_ids).to match_array([driving_licence_1.id, driving_licence_2.id])

        expect(offer[:error]).to eq(nil)
      end
    end
    context "when all data is not correct" do
      let(:params) do
        {
          id:                     offer.id,
          title:                  '',
          vacancies_quantity:     '2',
          "close_date(1i)"=>      '2020',
          "close_date(2i)"=>      '1',
          "close_date(3i)"=>      '4',
          immediate_start:        '1',
          status:                 'active',
          offer_type_id:          offer_type.id,
          work_mode_id:           work_mode.id,
          contract_type_id:       contract_type.id,
          city_id:                city.id,
          educational_degree_id:  educational_degree.id,
          job_categories:         ["#{job_category_1.id}", "#{job_category_2.id}"],
          work_positions:         ["#{work_position_1.id}", "#{work_position_2.id}"],
          sexes:                  ["#{sex_1.id}", "#{sex_2.id}"],
          available_work_days:    ["#{available_work_day_1.id}", "#{available_work_day_2.id}"],
          working_days:           ["#{working_day_1.id}", "#{working_day_2.id}"],
          job_aids:               ["#{job_aid_1.id}", "#{job_aid_2.id}"],
          responsibilities:       ["#{responsibility_1.id}", "#{responsibility_2.id}"],
          requirements:           ["#{requirement_1.id}", "#{requirement_2.id}"],
          vehicles:               ["#{vehicle_1.id}", "#{vehicle_2.id}"],
          driving_licences:       ["#{driving_licence_1.id}", "#{driving_licence_2.id}"],
          age_range: {
            to:   '750000',
            from: '750000',
            offer_id: offer.id
          },
          offer_salary: {
            to:   '750000',
            from: '750000',
            is_range: '1',
            offer_id: offer.id,
            salary_period_id: salary_period.id,
            currency_id: currency.id
          },
          offer_required_experiences: {
            duration: '2',
            duration_type_id: duration_type.id,
            offer_id: offer.id
          },
          offers_technical_skills: {
            technical_skill_id: technical_skill.id,
            level_id: level.id,
            offer_id: offer.id
          },
          languages_offers: {
            language_id: language.id,
            level_id: level.id,
            offer_id: offer.id
          }
        }
      end

      it "Should return a errors new offer" do
        offer = subject.(update_params: params)

        expect(offer[:status]).to eq(:error)

        expect(offer[:data]).to be_an_instance_of(Offer)

        expect(offer[:data].errors.details).to eq({:title => [{:error=>:blank}, {:count=>3, :error=>:too_short}]})
      end
    end
  end
end

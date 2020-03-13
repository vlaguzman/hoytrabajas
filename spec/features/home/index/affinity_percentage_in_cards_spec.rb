require 'rails_helper'

RSpec.describe 'like an logged user', type: :feature do

  describe 'see affinity percentages' do

    let!(:available_work_day) { create(:available_work_day) }
    let!(:educational_degree) { create(:educational_degree) }
    let!(:driving_licence)    { create(:driving_licence) }
    let!(:technical_skill)    { create(:technical_skill) }
    let!(:level)              { create(:level) }
    let!(:contract_type)      { create(:contract_type) }
    let!(:language)           { create(:language) }
    let!(:job_category)       { create(:job_category) }
    let!(:working_day)        { create(:working_day) }
    let!(:work_mode)          { create(:work_mode) }
    let!(:soft_skill)         { create(:soft_skill) }
    let!(:vehicle)            { create(:vehicle) }
    let!(:city)               { create(:city) }
    let!(:sex)                { create(:sex) }

    let!(:user_curriculum_vitae_1) {
      create(:user,
        educational_degree_id: educational_degree.id,
        driving_licences:      [driving_licence],
        vehicles:              [vehicle],
        sex_id:                sex.id
      )
    }

    let!(:curriculum_vitae_1) {
      create(:curriculum_vitae,
        about_me:            'CV 1',
        user:                user_curriculum_vitae_1,
        available_work_days: [available_work_day],
        contract_type_id:    contract_type.id,
        job_categories:      [job_category],
        working_days:        [working_day],
        work_modes:          [work_mode],
        soft_skills:         [soft_skill],
        city:                city
      )
    }

    let!(:offer_1) {
      create(:offer,
        title: 'OFFER ONE',
        status: :active,
        available_work_days:   [available_work_day],
        educational_degree_id: educational_degree.id,
        driving_licences:      [driving_licence],
        contract_type_id:      contract_type.id,
        job_categories:        [job_category],
        working_days:          [working_day],
        work_mode_id:          work_mode.id,
        soft_skills:           [soft_skill],
        vehicles:              [vehicle],
        city:                  city,
        sexes:                 [sex],
      )
    }

    let!(:cv_technical_skill)    { create(:curriculum_vitaes_technical_skills, curriculum_vitae_id: curriculum_vitae_1.id, technical_skill_id: technical_skill.id, level_id: level.id) }
    let!(:offer_technical_skill) { create(:offers_technical_skills, offer_id: offer_1.id, technical_skill_id: technical_skill.id, level_id: level.id) }
    let!(:cv_language)           { create(:curriculum_vitaes_languages, curriculum_vitae_id: curriculum_vitae_1.id, language_id: language.id, level_id: level.id) }
    let!(:offer_language)        { create(:languages_offers, offer_id: offer_1.id, language_id: language.id, level_id: level.id) }
    let!(:cv_language)           { create(:curriculum_vitaes_languages, curriculum_vitae_id: curriculum_vitae_1.id, language_id: language.id, level_id: level.id) }

    context 'when user does not have affinity percentage' do
      scenario 'should create new affinity percentage and return offer card with percentage', js: true do
        sign_in user_curriculum_vitae_1
        expect(AffinityPercentage.all.count).to eq(0)

        visit root_path
        expect(AffinityPercentage.all.count).to eq(1)

        affinity_percentage_expected = AffinityCalculator.new(offer_1, user_curriculum_vitae_1).affinity_percentage

        within "#offer_#{offer_1.id}" do
          expect(page).to have_text("#{affinity_percentage_expected}%")
        end
      end
    end

    context 'when user does have affinity percentage' do
      let!(:affinity_percentage_object) { create(:affinity_percentage, version: '1.0', affinity_percentage: 90.0, offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_1.id) }

      scenario 'should return offer card with percentage', js: true do
        sign_in user_curriculum_vitae_1
        expect(AffinityPercentage.all.count).to eq(1)

        visit root_path
        expect(AffinityPercentage.all.count).to eq(1)

        within "#offer_#{offer_1.id}" do
          expect(page).to have_text("#{affinity_percentage_object.affinity_percentage.round}%")
        end
      end
    end
  end
end

require 'rails_helper'

RSpec.describe AffinityPercentages::CreateAffinityPercentagesService do

  describe '#create_affinity' do

    before { Timecop.freeze(Time.zone.parse("2020-01-01 13:00:00")) }
    after  { Timecop.return }

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

    let!(:user_curriculum_vitae) {
      create(:user,
        educational_degree_id: educational_degree.id,
        driving_licences:      [driving_licence],
        vehicles:              [vehicle],
        sex_id:                sex.id
      )
    }

    let!(:curriculum_vitae) {
      create(:curriculum_vitae,
        about_me:            'CV 1',
        user:                user_curriculum_vitae,
        available_work_days: [available_work_day],
        contract_type_id:    contract_type.id,
        job_categories:      [job_category],
        working_days:        [working_day],
        work_modes:          [work_mode],
        soft_skills:         [soft_skill],
        city:                city
      )
    }

    let!(:offer) {
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

    let!(:cv_technical_skill)    { create(:curriculum_vitaes_technical_skills, curriculum_vitae_id: curriculum_vitae.id, technical_skill_id: technical_skill.id, level_id: level.id) }
    let!(:offer_technical_skill) { create(:offers_technical_skills, offer_id: offer.id, technical_skill_id: technical_skill.id, level_id: level.id) }
    let!(:cv_language)           { create(:curriculum_vitaes_languages, curriculum_vitae_id: curriculum_vitae.id, language_id: language.id, level_id: level.id) }
    let!(:offer_language)        { create(:languages_offers, offer_id: offer.id, language_id: language.id, level_id: level.id) }

    context 'when I want create AffinityPercentage' do

      it 'should create new AffinityPercentage object with new data' do

        expect(AffinityPercentage.all.count).to eq(0)

        offer.reload
        curriculum_vitae.reload

        affinity_percentage = subject.create_affinity(offer, curriculum_vitae)

        expect(AffinityPercentage.all.count).to eq(1)

        expect(affinity_percentage.affinity_percentage).to eq(60.0)
        expect(affinity_percentage.version).to eq('1.0')

        expect(affinity_percentage.available_work_days_curriculum_vitae).to eq("#{available_work_day.description}")
        expect(affinity_percentage.available_work_days_offer).to eq("#{available_work_day.description}")

        expect(affinity_percentage.educational_degree_curriculum_vitae).to eq(curriculum_vitae.user.educational_degree.description)
        expect(affinity_percentage.educational_degree_offer).to eq(educational_degree.description)

        expect(affinity_percentage.educational_level_curriculum_vitae).to be_nil
        expect(affinity_percentage.educational_level_offer).to be_nil

        expect(affinity_percentage.to_learn_skills_curriculum_vitae).to be_nil
        expect(affinity_percentage.to_learn_skills_offer).to be_nil

        expect(affinity_percentage.driving_licences_curriculum_vitae).to eq("#{driving_licence.description}")
        expect(affinity_percentage.driving_licences_offer).to eq("#{driving_licence.description}")

        expect(affinity_percentage.technical_skills_curriculum_vitae).to eq("#{technical_skill.description}")
        expect(affinity_percentage.technical_skills_offer).to eq("#{technical_skill.description}")

        expect(affinity_percentage.contract_type_id_curriculum_vitae).to eq("#{contract_type.description}")
        expect(affinity_percentage.contract_type_id_offer).to eq("#{contract_type.description}")

        expect(affinity_percentage.languages_list_curriculum_vitae).to eq("#{language.description}")
        expect(affinity_percentage.languages_list_offer).to eq("#{language.description}")

        expect(affinity_percentage.job_categories_curriculum_vitae).to eq("#{job_category.description}")
        expect(affinity_percentage.job_categories_offer).to eq("#{job_category.description}")

        expect(affinity_percentage.working_days_curriculum_vitae).to eq("#{working_day.description}")
        expect(affinity_percentage.working_days_offer).to eq("#{working_day.description}")

        expect(affinity_percentage.work_mode_id_curriculum_vitae).to eq("#{work_mode.description}")
        expect(affinity_percentage.work_mode_id_offer).to eq("#{work_mode.description}")

        expect(affinity_percentage.soft_skills_curriculum_vitae).to eq("#{soft_skill.description}")
        expect(affinity_percentage.soft_skills_offer).to eq("#{soft_skill.description}")

        expect(affinity_percentage.vehicles_curriculum_vitae).to eq("#{vehicle.description}")
        expect(affinity_percentage.vehicles_offer).to eq("#{vehicle.description}")

        expect(affinity_percentage.city_id_curriculum_vitae).to eq("#{city.description}")
        expect(affinity_percentage.city_id_offer).to eq("#{city.description}")

        expect(affinity_percentage.sexes_curriculum_vitae).to eq("#{sex.description}")
        expect(affinity_percentage.sexes_offer).to eq("#{sex.description}")
      end
    end
  end
end

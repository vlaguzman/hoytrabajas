require 'rails_helper'

RSpec.describe AffinityPercentages::ExecuteWorkerService do

  describe '#call' do

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

    let!(:user_curriculum_vitae) { create(:user, educational_degree_id: educational_degree.id, driving_licences: [driving_licence], vehicles: [vehicle], sex_id: sex.id) }

    let!(:curriculum_vitae) { create(:curriculum_vitae, user: user_curriculum_vitae, available_work_days: [available_work_day], contract_type_id: contract_type.id, job_categories: [job_category], working_days: [working_day], work_modes: [work_mode], soft_skills: [soft_skill], city: city) }

    let!(:offer) { create(:offer, status: 'active') }

    let!(:cv_technical_skill)    { create(:curriculum_vitaes_technical_skills, curriculum_vitae_id: curriculum_vitae.id, technical_skill_id: technical_skill.id, level_id: level.id) }
    let!(:cv_language)           { create(:curriculum_vitaes_languages, curriculum_vitae_id: curriculum_vitae.id, language_id: language.id, level_id: level.id) }

    context 'when AffinityPercentage does exist' do
      let!(:affinity_percentage) {
        create(:affinity_percentage,
          offer_id:                              offer.id,
          curriculum_vitae_id:                   curriculum_vitae.id,
          affinity_percentage:                   60.0,
          version:                               "1.0",
          sexes_offer:                           "should not update",
          sexes_curriculum_vitae:                "",
          available_work_days_offer:             "should not update",
          available_work_days_curriculum_vitae:  "",
          educational_degree_offer:              "should not update",
          educational_degree_curriculum_vitae:   "",
          educational_level_offer:               nil,
          educational_level_curriculum_vitae:    nil,
          driving_licences_offer:                "should not update",
          driving_licences_curriculum_vitae:     "should be  update",
          technical_skills_offer:                "should not update",
          technical_skills_curriculum_vitae:     "should be  update",
          contract_type_id_offer:                "should not update",
          contract_type_id_curriculum_vitae:     "should be  update",
          to_learn_skills_offer:                 nil,
          to_learn_skills_curriculum_vitae:      nil,
          languages_list_offer:                  "should not update",
          languages_list_curriculum_vitae:       "should be  update",
          job_categories_offer:                  "should not update",
          job_categories_curriculum_vitae:       "should be  update",
          working_days_offer:                    "should not update",
          working_days_curriculum_vitae:         "should be  update",
          work_mode_id_offer:                    "should not update",
          work_mode_id_curriculum_vitae:         "should be  update",
          soft_skills_offer:                     "should not update",
          soft_skills_curriculum_vitae:          "should be  update",
          vehicles_offer:                        "should not update",
          vehicles_curriculum_vitae:             "should be  update",
          city_id_offer:                         "should not update",
          city_id_curriculum_vitae:              "should be  update"
        )
      }

      it 'should update AffinityPercentage' do

        expect(AffinityPercentage.all.count).to eq(1)

        response = subject.(curriculum_vitae.id)

        expect(response).to match_array([affinity_percentage])

        affinity_percentage.reload

        expect(affinity_percentage.affinity_percentage).to eq(60.0)
        expect(affinity_percentage.version).to eq('1.0')

        expect(affinity_percentage.available_work_days_curriculum_vitae).to eq("#{available_work_day.description}")
        expect(affinity_percentage.educational_degree_curriculum_vitae).to eq(curriculum_vitae.user.educational_degree.description)
        expect(affinity_percentage.educational_level_curriculum_vitae).to be_nil
        expect(affinity_percentage.to_learn_skills_curriculum_vitae).to be_nil
        expect(affinity_percentage.driving_licences_curriculum_vitae).to eq("#{driving_licence.description}")
        expect(affinity_percentage.technical_skills_curriculum_vitae).to eq("#{technical_skill.description}")
        expect(affinity_percentage.contract_type_id_curriculum_vitae).to eq("#{contract_type.description}")
        expect(affinity_percentage.languages_list_curriculum_vitae).to eq("#{language.description}")
        expect(affinity_percentage.job_categories_curriculum_vitae).to eq("#{job_category.description}")
        expect(affinity_percentage.working_days_curriculum_vitae).to eq("#{working_day.description}")
        expect(affinity_percentage.work_mode_id_curriculum_vitae).to eq("#{work_mode.description}")
        expect(affinity_percentage.soft_skills_curriculum_vitae).to eq("#{soft_skill.description}")
        expect(affinity_percentage.vehicles_curriculum_vitae).to eq("#{vehicle.description}")
        expect(affinity_percentage.city_id_curriculum_vitae).to eq("#{city.description}")
        expect(affinity_percentage.sexes_curriculum_vitae).to eq("#{sex.description}")

        expect(affinity_percentage.available_work_days_offer).to eq("should not update")
        expect(affinity_percentage.educational_degree_offer).to  eq("should not update")
        expect(affinity_percentage.educational_level_offer).to be_nil
        expect(affinity_percentage.to_learn_skills_offer).to be_nil
        expect(affinity_percentage.driving_licences_offer).to eq("should not update")
        expect(affinity_percentage.technical_skills_offer).to eq("should not update")
        expect(affinity_percentage.contract_type_id_offer).to eq("should not update")
        expect(affinity_percentage.languages_list_offer).to eq("should not update")
        expect(affinity_percentage.job_categories_offer).to eq("should not update")
        expect(affinity_percentage.working_days_offer).to eq("should not update")
        expect(affinity_percentage.work_mode_id_offer).to eq("should not update")
        expect(affinity_percentage.soft_skills_offer).to eq("should not update")
        expect(affinity_percentage.vehicles_offer).to eq("should not update")
        expect(affinity_percentage.city_id_offer).to eq("should not update")
        expect(affinity_percentage.sexes_offer).to eq("should not update")
      end
    end

    context 'when AffinityPercentage does not exist' do
      it 'should not create AffinityPercentage and return nil' do
        expect(AffinityPercentage.all.count).to eq(0)

        response = subject.(curriculum_vitae.id)

        expect(AffinityPercentage.all.count).to eq(0)

        expect(response).to be_nil
      end
    end

    context 'when CurriculumVitae does not exist' do
      it 'should return nil' do
        expect(AffinityPercentage.all.count).to eq(0)

        response = subject.(0)

        expect(response).to be_nil
      end
    end
  end
end

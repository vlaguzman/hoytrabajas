require 'rails_helper'

RSpec.describe AffinityPercentages::CreateAffinityPercentagesService do

  describe '#call' do

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

    let!(:curriculum_vitae_2) { create(:curriculum_vitae, about_me: 'CV 2') }
    let!(:offer_2)            { create(:offer, status: :active, title: 'OFFER 2') }

    describe 'By each active offer and curriculum vitae, should create one AffinityPercentage' do

      context 'when AffinityPercentage does not exist' do

        it 'should create new AffinityPercentage object with new data' do

          expect(AffinityPercentage.all.count).to eq(0)

          response = subject.()

          expect(response).to match_array([[{}, {}], [{}, {}]])

          expect(AffinityPercentage.all.count).to eq(4)

          affinity_percentages = [
            AffinityPercentage.find_by(offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_1.id),
            AffinityPercentage.find_by(offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_2.id),
            AffinityPercentage.find_by(offer_id: offer_2.id, curriculum_vitae_id: curriculum_vitae_1.id),
            AffinityPercentage.find_by(offer_id: offer_2.id, curriculum_vitae_id: curriculum_vitae_2.id)
          ]

          affinity_percentages.each do |affinity_percentage|
            expect(affinity_percentage).to_not be_nil
          end

          affinity_percentage_1 = AffinityPercentage.find_by(offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_1.id)

          expect(affinity_percentage_1.affinity_percentage).to eq(60.0)
          expect(affinity_percentage_1.version).to eq('1.0')

          expect(affinity_percentage_1.available_work_days_curriculum_vitae).to eq("#{available_work_day.description}")
          expect(affinity_percentage_1.available_work_days_offer).to eq("#{available_work_day.description}")

          expect(affinity_percentage_1.educational_degree_curriculum_vitae).to eq(curriculum_vitae_1.user.educational_degree.description)
          expect(affinity_percentage_1.educational_degree_offer).to eq(educational_degree.description)

          expect(affinity_percentage_1.educational_level_curriculum_vitae).to be_nil
          expect(affinity_percentage_1.educational_level_offer).to be_nil

          expect(affinity_percentage_1.to_learn_skills_curriculum_vitae).to be_nil
          expect(affinity_percentage_1.to_learn_skills_offer).to be_nil

          expect(affinity_percentage_1.driving_licences_curriculum_vitae).to eq("#{driving_licence.description}")
          expect(affinity_percentage_1.driving_licences_offer).to eq("#{driving_licence.description}")

          expect(affinity_percentage_1.technical_skills_curriculum_vitae).to eq("#{technical_skill.description}")
          expect(affinity_percentage_1.technical_skills_offer).to eq("#{technical_skill.description}")

          expect(affinity_percentage_1.contract_type_id_curriculum_vitae).to eq("#{contract_type.description}")
          expect(affinity_percentage_1.contract_type_id_offer).to eq("#{contract_type.description}")

          expect(affinity_percentage_1.languages_list_curriculum_vitae).to eq("#{language.description}")
          expect(affinity_percentage_1.languages_list_offer).to eq("#{language.description}")

          expect(affinity_percentage_1.job_categories_curriculum_vitae).to eq("#{job_category.description}")
          expect(affinity_percentage_1.job_categories_offer).to eq("#{job_category.description}")

          expect(affinity_percentage_1.working_days_curriculum_vitae).to eq("#{working_day.description}")
          expect(affinity_percentage_1.working_days_offer).to eq("#{working_day.description}")

          expect(affinity_percentage_1.work_mode_id_curriculum_vitae).to eq("#{work_mode.description}")
          expect(affinity_percentage_1.work_mode_id_offer).to eq("#{work_mode.description}")

          expect(affinity_percentage_1.soft_skills_curriculum_vitae).to eq("#{soft_skill.description}")
          expect(affinity_percentage_1.soft_skills_offer).to eq("#{soft_skill.description}")

          expect(affinity_percentage_1.vehicles_curriculum_vitae).to eq("#{vehicle.description}")
          expect(affinity_percentage_1.vehicles_offer).to eq("#{vehicle.description}")

          expect(affinity_percentage_1.city_id_curriculum_vitae).to eq("#{city.description}")
          expect(affinity_percentage_1.city_id_offer).to eq("#{city.description}")

          expect(affinity_percentage_1.sexes_curriculum_vitae).to eq("#{sex.description}")
          expect(affinity_percentage_1.sexes_offer).to eq("#{sex.description}")

        end
      end

      context 'when exist AffinityPercentage' do
        context 'affinity percentage is created at one day before' do
          let!(:affinity_percentage_before_day) { create(:affinity_percentage, offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_1.id, created_at: Time.zone.parse("2020-01-01 23:55:00")) }

          before { Timecop.freeze(Time.zone.parse("2020-01-02 13:00:00")) }
          after  { Timecop.return }

          context 'when offer is updated, offer updated_at greater than AffinityPercentage created_at)' do
            it 'should create new AffinityPercentage object with new data' do
              offer_1.update(title: 'Oferta actualizada')

              expect(AffinityPercentage.all.count).to eq(1)

              response = subject.()

              expect(response).to match_array([[{}, {}], [{}, {}]])

              expect(AffinityPercentage.all.count).to eq(5)

              affinity_percentage = AffinityPercentage.where(offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_1.id)

              expect(affinity_percentage.count).to eq(2)
              expect(affinity_percentage.first.created_at.strftime("%F")).to eq("2020-01-01")
              expect(affinity_percentage.last.created_at.strftime("%F")).to eq("2020-01-02")
            end
          end

          context 'when curriculum vitae is updated, curriculum vitae updated_at greater than AffinityPercentage created_at)' do
            it 'should create new AffinityPercentage object with new data' do
              curriculum_vitae_1.update(about_me: 'Hoja de vida actualizada!')

              expect(AffinityPercentage.all.count).to eq(1)

              response = subject.()

              expect(response).to match_array([[{}, {}], [{}, {}]])

              expect(AffinityPercentage.all.count).to eq(5)

              affinity_percentage = AffinityPercentage.where(offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_1.id)

              expect(affinity_percentage.count).to eq(2)
              expect(affinity_percentage.first.created_at.strftime("%F")).to eq("2020-01-01")
              expect(affinity_percentage.last.created_at.strftime("%F")).to eq("2020-01-02")
            end
          end

          context 'when user of curriculum vitae is updated, curriculum vitae user updated_at greater than AffinityPercentage created_at)' do
            it 'should create new AffinityPercentage object with new data' do
              curriculum_vitae_1.user.update(email: "user@actualizado.com")

              expect(AffinityPercentage.all.count).to eq(1)

              response = subject.()

              expect(response).to match_array([[{}, {}], [{}, {}]])

              expect(AffinityPercentage.all.count).to eq(5)

              affinity_percentage = AffinityPercentage.where(offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_1.id)

              expect(affinity_percentage.count).to eq(2)
              expect(affinity_percentage.first.created_at.strftime("%F")).to eq("2020-01-01")
              expect(affinity_percentage.last.created_at.strftime("%F")).to eq("2020-01-02")
            end
          end
        end

        context 'when offer is not updated, offer updated_at equal than AffinityPercentage created_at)' do
          let!(:affinity_percentage_1) { create(:affinity_percentage, offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_1.id) }
          let!(:affinity_percentage_2) { create(:affinity_percentage, offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_2.id) }
          let!(:affinity_percentage_3) { create(:affinity_percentage, offer_id: offer_2.id, curriculum_vitae_id: curriculum_vitae_1.id) }
          let!(:affinity_percentage_4) { create(:affinity_percentage, offer_id: offer_2.id, curriculum_vitae_id: curriculum_vitae_2.id) }

          before { Timecop.freeze(Time.zone.parse("2020-01-02 13:00:00")) }
          after  { Timecop.return }

          it 'should not create new AffinityPercentage object with new data' do

            expect(AffinityPercentage.all.count).to eq(4)

            response = subject.()

            expect(response).to match_array([[{}, {}], [{}, {}]])

            expect(AffinityPercentage.all.count).to eq(4)
          end
        end
      end
    end
  end
end

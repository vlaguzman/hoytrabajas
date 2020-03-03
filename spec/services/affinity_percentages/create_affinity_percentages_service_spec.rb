require 'rails_helper'

RSpec.describe AffinityPercentages::CreateAffinityPercentagesService do

  describe '#call' do

    before { Timecop.freeze(Time.new(2020, 04, 01, 13, 00, 00)) }
    after  { Timecop.return }

    let!(:available_work_day) { create(:available_work_day) }
    let!(:educational_degree) { create(:educational_degree) }
   #let!(:educational_level)  { create(:educational_level) }
    let!(:driving_licence)    { create(:driving_licence) }
    let!(:technical_skill)    { create(:technical_skill) }
    let!(:level)              { create(:level) }
    let!(:contract_type)      { create(:contract_type) }
    let!(:language)           { create(:language) }
    let!(:job)           { create(:language) }

    let!(:user_curriculum_vitae_1) {
      create(:user,
        educational_degree_id: educational_degree.id,
        driving_licences:      [driving_licence],
      )
    }

    let!(:curriculum_vitae_1) {
      create(:curriculum_vitae,
        user:                user_curriculum_vitae_1,
        available_work_days: [available_work_day],
   #    educational_levels:  [educational_level],
        contract_type_id:    contract_type.id,
      )
    }

    let!(:offer_1) {
      create(:offer,
        status: :active,
        available_work_days:   [available_work_day],
        educational_degree_id: educational_degree.id,
   #    educational_level:     [educational_level],
        driving_licences:      [driving_licence],
        contract_type_id:    contract_type.id,
      )
    }

    let!(:cv_technical_skill)    { create(:curriculum_vitaes_technical_skills, curriculum_vitae_id: curriculum_vitae_1.id, technical_skill_id: technical_skill.id, level_id: level.id) }
    let!(:offer_technical_skill) { create(:offers_technical_skills, offer_id: offer_1.id, technical_skill_id: technical_skill.id, level_id: level.id) }

    let!(:cv_language)    { create(:curriculum_vitaes_languages, curriculum_vitae_id: curriculum_vitae_1.id, language_id: language.id, level_id: level.id) }
    let!(:offer_language) { create(:languages_offers, offer_id: offer_1.id, language_id: language.id, level_id: level.id) }

    let!(:curriculum_vitae_2) { create(:curriculum_vitae) }
    let!(:offer_2)            { create(:offer, status: :active) }

    describe 'Por cada oferta activa y hoja de vida, se debe crear o atualizar el AffinityPercentage relacionado' do

      context 'cuando el AffinityPercentage no ha sido creado' do

        it 'deberia crearse un nuevo objeto de AffinityPercentage con los datos nuevos' do

          expect(AffinityPercentage.all.count).to eq(0)

          subject.()

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

         #expect(affinity_percentage_1.affinity_percentage).to eq()
          expect(affinity_percentage_1.version).to eq('1.0')

          expect(affinity_percentage_1.available_work_days_curriculum_vitae).to eq("#{available_work_day.description}")
          expect(affinity_percentage_1.available_work_days_offer).to eq("#{available_work_day.description}")

          expect(affinity_percentage_1.educational_degree_curriculum_vitae).to eq(curriculum_vitae_1.user.educational_degree.description)
          expect(affinity_percentage_1.educational_degree_offer).to eq(educational_degree.description)

         #expect(affinity_percentage_1.educational_level_curriculum_vitae).to eq("#{educational_level.degree}")
         #expect(affinity_percentage_1.educational_level_offer).to eq("#{educational_level.degree}")

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

         #expect(affinity_percentage_1.working_days_curriculum_vitae:        clean_array(curriculum_vitae.working_days.pluck(:description)),
         #expect(affinity_percentage_1.working_days_offer:        clean_array(offer.working_days.pluck(:description)),

         #expect(affinity_percentage_1.work_mode_id_curriculum_vitae:        clean_array(curriculum_vitae.work_modes.pluck(:description)),
         #expect(affinity_percentage_1.work_mode_id_offer:        try_data(offer.work_mode, :description),

         #expect(affinity_percentage_1.soft_skills_curriculum_vitae:         clean_array(curriculum_vitae.soft_skills.pluck(:description)),
         #expect(affinity_percentage_1.soft_skills_offer:         clean_array(offer.soft_skills.pluck(:description)),

         #expect(affinity_percentage_1.vehicles_curriculum_vitae:            clean_array(curriculum_vitae.user.vehicles.pluck(:description)),
         #expect(affinity_percentage_1.vehicles_offer:            clean_array(offer.vehicles.pluck(:description)),

         #expect(affinity_percentage_1.city_id_curriculum_vitae:             try_data(curriculum_vitae.city, :description),
         #expect(affinity_percentage_1.city_id_offer:             try_data(offer.city, :description),

         #expect(affinity_percentage_1.sexes_curriculum_vitae:               try_data(curriculum_vitae.user.sex, :description)
         #expect(affinity_percentage_1.sexes_offer:               clean_array(offer.sexes.pluck(:description))

        end
      end

      context 'cuando el AffinityPercentage ha sido creado' do

        context 'cuando la oferta es actualizada(su updated at no corresponde al de la creacion de AffinityPercentage)' do
          let!(:affinity_percentage) { create(:affinity_percentage, offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_1.id, created_at: Time.new(2020, 04, 01, 20, 00, 00)) }

          before { Timecop.freeze(Time.new(2020, 05, 01, 13, 00, 00)) }
          after  { Timecop.return }

          it 'deberia crearse un nuevo objeto de AffinityPercentage con los datos nuevos' do
            offer_1.update(title: 'Oferta actualizada')

            expect(AffinityPercentage.all.count).to eq(1)

            subject.()

            expect(AffinityPercentage.all.count).to eq(5)
          end
        end

        context 'cuando la hoja de vida es actualizada(su updated at no corresponde al de la creacion de AffinityPercentage)' do
          let!(:affinity_percentage) { create(:affinity_percentage, offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_1.id, created_at: Time.new(2020, 04, 01, 20, 00, 00)) }

          before { Timecop.freeze(Time.new(2020, 05, 01, 13, 00, 00)) }
          after  { Timecop.return }

          it 'deberia crearse un nuevo objeto de AffinityPercentage con los datos nuevos' do
            curriculum_vitae_1.update(about_me: 'Hoja de vida actualizada!')

            expect(AffinityPercentage.all.count).to eq(1)

            subject.()

            expect(AffinityPercentage.all.count).to eq(5)
          end
        end

        context 'cuando el usuario relacionado a la hoja de vida es actualizada(su updated at no corresponde al de la creacion de AffinityPercentage)' do
          let!(:affinity_percentage) { create(:affinity_percentage, offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_1.id, created_at: Time.new(2020, 04, 01, 20, 00, 00)) }

          before { Timecop.freeze(Time.new(2020, 05, 01, 13, 00, 00)) }
          after  { Timecop.return }

          it 'deberia crearse un nuevo objeto de AffinityPercentage con los datos nuevos' do
            curriculum_vitae_1.user.update(email: "user@actualizado.com")

            expect(AffinityPercentage.all.count).to eq(1)

            subject.()

            expect(AffinityPercentage.all.count).to eq(5)
          end
        end

        context 'cuando la oferta no fue actualizada(su updated_at coincide con el created_at del AffinityPercentage)' do
          let!(:affinity_percentage_1) { create(:affinity_percentage, offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_1.id) }
          let!(:affinity_percentage_2) { create(:affinity_percentage, offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_2.id) }
          let!(:affinity_percentage_3) { create(:affinity_percentage, offer_id: offer_2.id, curriculum_vitae_id: curriculum_vitae_1.id) }
          let!(:affinity_percentage_4) { create(:affinity_percentage, offer_id: offer_2.id, curriculum_vitae_id: curriculum_vitae_2.id) }

          before { Timecop.freeze(Time.new(2020, 04, 02, 13, 00, 00)) }
          after  { Timecop.return }

          it 'no deberia crear un nuevo registro de AffinityPercentage' do

            expect(AffinityPercentage.all.count).to eq(4)

            subject.()

            expect(AffinityPercentage.all.count).to eq(4)
          end
        end
      end
    end
  end
end

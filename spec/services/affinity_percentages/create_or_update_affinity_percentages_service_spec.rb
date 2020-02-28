require 'rails_helper'

RSpec.describe AffinityPercentages::CreateOrUpdateAffinityPercentagesService do

  describe '#call' do

    let!(:offer_1) { create(:offer, status: :active, created_at: Time.new(2020, 04, 01, 13, 00, 00)) }
    let!(:offer_2) { create(:offer, status: :active, created_at: Time.new(2020, 04, 01, 13, 00, 00)) }

    let!(:curriculum_vitae_1) { create(:curriculum_vitae) }
    let!(:curriculum_vitae_2) { create(:curriculum_vitae) }

    describe 'Por cada oferta activa y hoja de vida, se debe crear o atualizar el AffinityPercentage relacionado' do

      context 'cuando el AffinityPercentage no ha sido creado' do

        it 'deberia crearse un nuevo objeto de AffinityPercentage con los datos nuevos' do

          expect(AffinityPercentage.all.count).to eq(0)

          subject.()

          expect(AffinityPercentage.all.count).to eq(4)

          affinity_percentages = [
            AffinityPercentages.find_by(offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_1.id),
            AffinityPercentages.find_by(offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_2.id),
            AffinityPercentages.find_by(offer_id: offer_2.id, curriculum_vitae_id: curriculum_vitae_1.id),
            AffinityPercentages.find_by(offer_id: offer_2.id, curriculum_vitae_id: curriculum_vitae_2.id)
          ]

          affinity_percentages.each do |affinity_percentage|
            expect(affinity_percentage).to_not be_nil
          end
        end
      end

      context 'cuando el AffinityPercentage ha sido creado' do
       #before { Timecop.freeze(Date.new(2020, 04, 01)) }
       #after  { Timecop.return }

        let!(:affinity_percentage_1) { create(:affinity_percentage, offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_1.id, created_at: Time.new(2020, 04, 01, 20, 00, 00)) }
        let!(:affinity_percentage_2) { create(:affinity_percentage, offer_id: offer_1.id, curriculum_vitae_id: curriculum_vitae_2.id, created_at: Time.new(2020, 04, 01, 20, 00, 00)) }
        let!(:affinity_percentage_3) { create(:affinity_percentage, offer_id: offer_2.id, curriculum_vitae_id: curriculum_vitae_1.id, created_at: Time.new(2020, 04, 01, 20, 00, 00)) }
        let!(:affinity_percentage_4) { create(:affinity_percentage, offer_id: offer_2.id, curriculum_vitae_id: curriculum_vitae_2.id, created_at: Time.new(2020, 04, 01, 20, 00, 00)) }

        context 'cuando la oferta es actualizada(su updated at no corresponde al de la creacion de AffinityPercentage)' do
          before { Timecop.freeze(Time.new(2020, 05, 01)) }
          after  { Timecop.return }

          it 'deberia crearse un nuevo objeto de AffinityPercentage con los datos nuevos' do
            offer_1.update(title: 'Oferta actualizada')

            expect(AffinityPercentage.all.count).to eq(4)

            subject.()

            expect(AffinityPercentage.all.count).to eq(5)
          end
        end

        context 'cuando la oferta no fue actualizada(su updated_at no coincide con el created_at del AffinityPercentage)' do
          before { Timecop.freeze(Time.new(2020, 05, 01)) }
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

require 'rails_helper'

RSpec.describe AffinityPercentageService do

  describe '#get_round_affinity' do

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

    let(:offer_2) { create(:offer) }
    let(:cv_2)    { create(:curriculum_vitae) }

    context 'when affinity percentage of offer and curriculum vitae does not exist' do
      context 'when affinity percentage value less than 20' do
        it 'should create new AffinityPercentage object and not return round affinity percentage value' do
          expect(AffinityPercentage.all.count).to eq(0)
          response = described_class.new(offer_2, cv_2).get_round_affinity

          expect(AffinityPercentage.all.count).to eq(1)
          expect(response).to be_nil
        end
      end

      context 'when affinity percentage value greater than 20' do
        it 'should create new AffinityPercentage object and return round affinity percentage value' do
          expect(AffinityPercentage.all.count).to eq(0)
          response = described_class.new(offer, curriculum_vitae).get_round_affinity

          expect(AffinityPercentage.all.count).to eq(1)
          expect(response).to eq(71)
        end
      end
    end

    context 'when affinity percentage of offer and curriculum vitae does exist' do
      let!(:affinity_percentage) { create(:affinity_percentage, offer: offer, curriculum_vitae: curriculum_vitae, version: '1.0', affinity_percentage: 100.0) }

      it 'should not create new AffinityPercentage object and return round affinity percentage value' do
        expect(AffinityPercentage.all.count).to eq(1)
        response = described_class.new(offer, curriculum_vitae).get_round_affinity

        expect(AffinityPercentage.all.count).to eq(1)
        expect(response).to eq(100)
      end
    end
  end
end

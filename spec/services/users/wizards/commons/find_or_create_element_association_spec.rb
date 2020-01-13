require 'rails_helper'

RSpec.describe Users::Wizards::Commons::FindOrCreateElementAssociation do

  describe "#call" do
    let(:new_work_experience) { build(:work_experience, :empty) }
    context "When element exist" do
      it "Should return assoc to the source" do
        response = subject.call(
          parent_source: new_work_experience,
          element_class: WorkPosition,
          element_key: :work_position,
          element_params: {work_position: 'RoR Full Stack Developer'}
        )

        expect(WorkPosition.count).to eq(1)
        expect(response[:work_position]).to be_an_instance_of(WorkPosition)
        expect(response[:work_position].description).to eq('RoR Full Stack Developer')
      end

      context "When element is a list of element" do
        let!(:stuff_technical_skills) do
          [
            create(:technical_skill, description: 'Lavar' ),
            create(:technical_skill, description: 'Cocinar' )
          ]
        end

        let(:new_work_experience) {
          build(:work_experience,technical_skills: [
            create(:technical_skill, description: 'Barrer' ),
            stuff_technical_skills[0]
            ])
        }

        it "should persist every element in the list" do
          response = subject.call(
            parent_source: new_work_experience,
            element_class: TechnicalSkill,
            element_key: :technical_skills,
            is_collection: :true,
            element_params: {technical_skills: 'Barrer, Planchar, Cocinar'}
          )

          expect(TechnicalSkill.count).to eq(4)
          expect(response[:technical_skills]).to match_array([
            TechnicalSkill.find_by(description: 'Barrer'),
            TechnicalSkill.find_by(description: 'Planchar'),
            TechnicalSkill.find_by(description: 'Cocinar'),
          ])
        end
      end
    end

    context "When element does not exist" do
      it "Should return assoc to the source" do
        expect(TechnicalSkill.count).to eq(0)

        response = subject.call(
          parent_source: new_work_experience,
          element_class: TechnicalSkill,
          element_key: :technical_skills,
          is_collection: :true,
          element_params: {technical_skills: 'SuperSkill'}
        )

        expect(response[:technical_skills]).to match_array([TechnicalSkill.find_by(description: 'SuperSkill' )])

        expect(TechnicalSkill.count).to eq(1)
      end
    end

    context "when params is nill or empty string" do
      it "Should no create element" do
        expect(TechnicalSkill.count).to eq(0)

        response = subject.call(
          parent_source: new_work_experience,
          element_class: TechnicalSkill,
          element_key: :technical_skills,
          is_collection: :true,
          element_params: {technical_skills: ''}
        )

        expect(response[:technical_skills]).to match_array([])

        expect(TechnicalSkill.count).to eq(0)
      end
    end
  end
end
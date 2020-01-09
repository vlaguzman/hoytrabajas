require 'rails_helper'

RSpec.describe Users::Wizards::StepOneService do
  let!(:document_type_id) { create(:document_type).id }
  let!(:city_id)          { create(:city).id }
  let!(:nationality_ids)  { [
    create(:nationality, description: "Argentina").id,
    create(:nationality, description: "Peruana").id
  ] }

  let(:candidate) {create(:user, :first_time_candidate) }
  let(:params) do
    {
      name: "False",
      last_name: "Fakeman",
      born_city_id: city_id,
      residence_city_id: city_id,
      document_type_id: document_type_id,
      contact_number: "12355552345",
      identification_number: "561234563",
      nationality_ids: nationality_ids
    }
  end

  it { should be_an_instance_of(Module) }

  describe "#call" do
    it "Should return a modified user" do
      modified_candidate = subject.(candidate: candidate, update_params: params )

      expect(User.count).to eq(1)
      expect(CurriculumVitae.count).to eq(1)

      expect(modified_candidate).to be_an_instance_of(User)
      expect(modified_candidate.curriculum_vitaes.count).to eq(1)

      expect(modified_candidate.name).to eq(params[:name])
      expect(modified_candidate.last_name).to eq(params[:last_name])

      save_born_city = City.find_by(id: params[:born_city_id])
      expect(modified_candidate.born_city).to eq(save_born_city)

      save_residence_city = City.find_by(id: params[:residence_city_id])
      expect(modified_candidate.residence_city).to eq(save_residence_city)

      saved_document_type = DocumentType.find_by(id: params[:document_type_id])
      expect(modified_candidate.document_type).to eq(saved_document_type)

      saved_nationalities = nationality_ids.map { |id| Nationality.find_by(id: id) }
      expect(modified_candidate.nationalities).to eq(saved_nationalities)

      expect(modified_candidate.identification_number).to eq(params[:identification_number])
      expect(modified_candidate.contact_number).to eq(params[:contact_number])
    end

  end
end

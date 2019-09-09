require 'rails_helper'

RSpec.describe Users::Wizards::StepTwoService do
  let!(:sexes) do
    [
      create(:sex, description: "male"),
      create(:sex, description: "female")
    ]
  end

  let!(:limitations) do
    [
      create(:limitation, description: "blind"),
      create(:limitation, description: "disabled")
    ]
  end

  let!(:educational_degree) { create(:educational_degree) }

  let(:candidate) {create(:user, :first_time_candidate) }

  let(:params) do
    {
      about_me:               "Adipisicing proident magna consequat qui tempor sint.",
      sex_id:                 sexes.last.id,
      birthday:               "1990-01-01",
      limitation_ids:         Limitation.pluck(:id),
      educational_degree_id:  educational_degree.id
    }
  end

  it { should be_an_instance_of(Module) }

  describe "#call" do
    it "Should return a modified user" do
      modified_candidate = subject.(candidate: candidate, update_params: params )

      expect(User.count).to eq(1)

      expect(modified_candidate).to be_an_instance_of(User)

      expect(modified_candidate.about_me).to eq(params[:about_me])

      expect(modified_candidate.sex.description).to eq("female")

      saved_birthday = Date.parse(params[:birthday])
      expect(modified_candidate.birthday).to    eq(saved_birthday)

      saved_limitations = params[:limitation_ids].map { |id| Limitation.find_by(id: id) }
      expect(modified_candidate.limitations).to match_array(saved_limitations)

      saved_educational_degree = EducationalDegree.find_by(id: params[:educational_degree_id])
      expect(modified_candidate.educational_degree).to eq(saved_educational_degree)
    end

  end
end
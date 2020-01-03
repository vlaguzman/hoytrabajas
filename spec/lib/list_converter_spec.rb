require 'rails_helper'

RSpec.describe ListConverter do

  describe "#model_array_list" do
    context "When model does not have records" do
      it "Should return a empty array" do
        the_response = subject.model_array_list(JobCategory)

        expect(the_response).to be_an_instance_of(Array)
        expect(the_response).to be_empty
      end

      it "Should return an array if the class doesnt exist" do
        expect(subject.model_array_list(nil)).to eq([])
      end
    end

    context "When the model have records" do
      it "should return the expected object" do
        job_category_one = create(:job_category, description: 'sales')
        job_category_two = create(:job_category, description: 'bars')
        expected_array_list = [['sales', job_category_one.id], ['bars', job_category_two.id]]

        the_response = subject.model_array_list(JobCategory)

        expect(the_response).to match_array(expected_array_list)
      end
    end
  end

  describe "#model_list" do
    context "When model does not have records" do
      it "Should return a empty array" do
        response = subject.model_list(JobCategory)

        expect(response).to be_an_instance_of(Array)
        expect(response).to be_empty
      end
    end

    context "When the model have records" do
      let(:create_expected_job_categories_list) do
        job_category_one = create(:job_category)
        job_category_two = create(:job_category)

        [
          {
            id: job_category_one.id,
            description: job_category_one.description
          },
          {
            id: job_category_two.id,
            description: job_category_two.description
          }
        ]
      end

      it "Should return the expected object" do
        expected_list = create_expected_job_categories_list
        response = subject.model_list(JobCategory)

        expect(response).to match_array(expected_list)
      end

      context "return object in order" do

        let(:create_cities) do
          [
            create(:city, description: "Zapapolis"),
            create(:city, description: "Someville"),
            create(:city, description: "Axioland"),
            create(:city, description: "Abecity")
          ]
        end

        it "Should appear in alphabetic order by default" do

          create_cities

          response = subject.model_list(City)

          expect(response.first[:description]).to eq("Abecity")
          expect(response[1][:description]).to eq("Axioland")
          expect(response[2][:description]).to eq("Someville")
          expect(response.last[:description]).to eq("Zapapolis")
        end

        it "Should not appear in alphabetic order by default" do

          create_cities

          response = subject.model_list(City, :no_sort)

          expect(response.first[:description]).to eq("Zapapolis")
          expect(response[1][:description]).to eq("Someville")
          expect(response[2][:description]).to eq("Axioland")
          expect(response.last[:description]).to eq("Abecity")
        end
      end
    end
  end

  describe "#parameters_list" do
    it { should respond_to(:parameters_list) }

    it "should return empty hash" do
      expect(subject.parameters_list).to eq([])
    end

    context "When the params are passed" do
      let(:cv) { create(:curriculum_vitae) }
      let!(:create_strong_skills) { create_list(:curriculum_vitaes_technical_skills, 5, curriculum_vitae: cv) }

      it "should return expected object" do
        response = subject.parameters_list(cv.strong_skills, [:job_category_id, :technical_skill_id, :level_id])

        expected_array = create_strong_skills.map do |sk|
          { job_category_id: sk.job_category_id, technical_skill_id: sk.technical_skill_id, level_id: sk.level_id }
        end

        expect(response).to match_array(expected_array)
      end

    end
  end

end

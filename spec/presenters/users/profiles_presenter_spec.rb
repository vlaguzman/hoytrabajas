require "rails_helper"

RSpec.describe Users::ProfilesPresenter do
  let!(:job_category)       { create(:job_category) }
  let!(:work_mode)          { create(:work_mode) }
  let!(:educational_level)  { create(:educational_level) }
  let!(:work_experience)    { create(:work_experience) }
  let!(:available_work_day) { create(:available_work_day) }
  let!(:contract_type)      { create(:contract_type) }
  let!(:offer_type)         { create(:offer_type) }
  let!(:curriculum_vitae_salary) { create(:curriculum_vitae_salary) }
  let!(:user)               { create(:user) }
  let(:subject)             { described_class.new(user) }
  let!(:curriculum_vitae)   { create(:curriculum_vitae, user: user,
                                educational_level_ids: [educational_level.id],
                                work_experience_ids: [work_experience.id],
                                job_category_ids: [job_category.id],
                                work_mode_ids: [work_mode.id],
                                offer_types: [offer_type],
                                contract_type: contract_type,
                                curriculum_vitae_salary: curriculum_vitae_salary,
                                available_work_days: [available_work_day])
                            }

  describe "#basic_user_data" do
    context "User basic information" do
      it "Should return data basic of user" do
        response = subject.basic_user_data

        result = {
          email:                 { value: user.email,                                                   class_empty: '' },
          name:                  { value: user.name,                                                    class_empty: '' },
          last_name:             { value: user.last_name,                                               class_empty: '' },
          contact_number:        { value: "311 353 5522",                                               class_empty: '' },
          birthday:              { value: user.birthday,                                                class_empty: '' },
          document_type:         { value: user.document_type_description,                               class_empty: '' },
          educational_degree:    { value: user.educational_degree_description,                          class_empty: '' },
          city:                  { value: user.city_description,                                        class_empty: '' },
          identification_number: { value: user.identification_number,                                   class_empty: '' },
          about_me:              { value: user.about_me,                                                class_empty: '' },
          nationalities:         { value: user.nationalities.pluck(:description),                       class_empty: '' },
          limitations:           { value: user.limitations.pluck(:description),                         class_empty: '' },
          vehicles:              { value: user.vehicles.pluck(:description),                            class_empty: '' },
          driving_licences:      { value: user.driving_licences.pluck(:description),                    class_empty: '' },
          born_state:            { value: user.born_city.state.description,                             class_empty: '' },
          born_city:             { value: user.born_city.description,                                   class_empty: '' },
          offer_types:           { value: curriculum_vitae.offer_types.pluck(:description),             class_empty: '' },
          work_modes:            { value: curriculum_vitae.work_modes.pluck(:description),              class_empty: '' },
          job_categories:        { value: curriculum_vitae.job_categories.pluck(:description),          class_empty: '' },
          available_work_days:   { value: curriculum_vitae.available_work_days.pluck(:description),     class_empty: '' },
          contract_type:         { value: curriculum_vitae.contract_type_description,                   class_empty: '' },
          labor_disponibility:   { value: curriculum_vitae.labor_disponibility_description,             class_empty: '' },
          travel_disponibility:  { value: "Si",                                                         class_empty: '' },
          salary:                { value: "COP 800000 a 5000000 / Monthly",                             class_empty: '' }
        }

        expect(response).to eq(result)

      end
    end

    context "When the attributes not have value" do

      let(:user)    { create(:user, :first_time_candidate)  }
      let(:curriculum_vitae)    { create(:curriculum_vitae, :empty)  }
      let(:subject) { described_class.new(user) }

      it "Should return the translation" do

        response = subject.basic_user_data

        result = {
          email:                 { value: user.email,                           class_empty: '' },
          name:                  { value: "Información sin completar",    class_empty: 'incomplete' },
          last_name:             { value: "Información sin completar",    class_empty: 'incomplete' },
          contact_number:        { value: "Información sin completar",    class_empty: 'incomplete' },
          birthday:              { value: "Información sin completar",    class_empty: 'incomplete' },
          document_type:         { value: "Información sin completar",    class_empty: 'incomplete' },
          educational_degree:    { value: "Información sin completar",    class_empty: 'incomplete' },
          city:                  { value: "Información sin completar",    class_empty: 'incomplete' },
          identification_number: { value: "Información sin completar",    class_empty: 'incomplete' },
          about_me:              { value: "Información sin completar",    class_empty: 'incomplete' },
          nationalities:         { value: ["Información sin completar"],  class_empty: 'incomplete' },
          limitations:           { value: ["Información sin completar"],  class_empty: 'incomplete' },
          vehicles:              { value: ["Información sin completar"],  class_empty: 'incomplete' },
          driving_licences:      { value: ["Información sin completar"],  class_empty: 'incomplete' },
          born_state:            { value: "Información sin completar",    class_empty: 'incomplete' },
          born_city:             { value: "Información sin completar",    class_empty: 'incomplete' },
          offer_types:           { value: ["Información sin completar"],  class_empty: 'incomplete' },
          work_modes:            { value: ["Información sin completar"],  class_empty: 'incomplete' },
          job_categories:        { value: ["Información sin completar"],  class_empty: 'incomplete' },
          available_work_days:   { value: ["Información sin completar"],  class_empty: 'incomplete' },
          contract_type:         { value: "Información sin completar",    class_empty: 'incomplete' },
          labor_disponibility:   { value: "Información sin completar",    class_empty: 'incomplete' },
          travel_disponibility:  { value: "No",                         class_empty: ''           },
          salary:                { value: "Información sin completar",    class_empty: 'incomplete' },
        }

        expect(response).to eq(result)

      end
    end
  end

  describe "#data_education" do
    context "When a user has a data" do
      it "Should return data user" do
        response = subject.data_education
        result = [
          {
            title: "Software Engineer",
            institution_name: "massachusetts institute of technology",
            city_id: educational_level.city.description,
            start_date: educational_level.start_date,
            finish_date: educational_level.finish_date,
            ongoing_study: false
          }
        ]

        expect(response).to eq(result)
      end
    end
  end

  describe "#applied_offer_data" do
  
    let(:my_offer)           { create(:offer) }
    let(:applied_offer)      { create(:applied_offer, curriculum_vitae: curriculum_vitae, offer: my_offer) }
    
    context "When there is an applied offer id" do
      let(:subject) { described_class.new(user, applied_offer_id: applied_offer.id) }

      it "Should return the applied_offer data" do
        response = subject.applied_offer_data

        result = {
          applied_offer_id: applied_offer.id,
          status: applied_offer.current_state,
          offer_id: applied_offer.offer_id,
          curriculum_vitae_id: curriculum_vitae.id
        }

        expect(response).to eq(result)
      end
    end

    context "When there is no applied offer id" do
      let(:subject) { described_class.new(user) }

      it "Should return nil as the applied_offer data" do
        response = subject.applied_offer_data

        expect(response).to eq(nil)
      end
    end
  end

  describe "#data_experience" do
    context "When a user has a data" do
      it "Should return data user" do
        response = subject.data_experience
        result = [
          {
            company_name: work_experience.company_name,
            work_position: work_experience.work_position.description,
            job_category: work_experience.job_category.description,
            started_at: work_experience.started_at,
            finished_at: work_experience.finished_at,
            still_in_progress: false
          }
        ]

        expect(response).to eq(result)
      end
    end
  end

  describe "#download_cv" do
    context "When user upload curriculum vitae" do
      it "Should return file" do
        curriculum_vitae.file_cv.attach(io: File.open(Rails.root.join('spec', 'factories', 'pdfs', 'diploma.pdf')), filename: 'diploma.pdf')

        response = subject.download_cv

        expect(response.include?("diploma.pdf")).to be_truthy
      end
    end
  end

  describe "#abilities_present?" do
    context "When a user has abilities" do
      it "Should return abilities of a user" do
        response = subject.abilities_present?
        result = {
          languages_list: false,
          soft_skills: false
        }

        expect(response).to eq(result)
      end
    end
  end

  describe "#all_attributes_present?" do
    context "When a user has all attributes" do
      it "Should return abilities" do
        abilities = subject.abilities_present?
        response = subject.all_attributes_present?(abilities)

        expect(response).to be_falsy
      end
    end
  end
end

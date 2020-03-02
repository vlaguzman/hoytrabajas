class Users::ProfilesPresenter < ApplicationPresenter

  def basic_user_data
    {
      email:                 get_value_of_record(source).validate_present?(:simple, :email),
      name:                  get_value_of_record(source).validate_present?(:simple, :name),
      last_name:             get_value_of_record(source).validate_present?(:simple, :last_name),
      birthday:              get_value_of_record(source).validate_present?(:simple, :birthday),
      identification_number: get_value_of_record(source).validate_present?(:simple, :identification_number),
      about_me:              get_value_of_record(source).validate_present?(:simple, :about_me),

      document_type:         get_value_of_record(source).validate_present?(:relation, :document_type),
      educational_degree:    get_value_of_record(source).validate_present?(:relation, :educational_degree),
      city:                  get_value_of_record(source).validate_present?(:relation, :city),
      born_city:             get_value_of_record(source).validate_present?(:relation, :born_city),
      contract_type:         get_value_of_record(curriculum_vitae).validate_present?(:relation, :contract_type),
      labor_disponibility:   get_value_of_record(curriculum_vitae).validate_present?(:relation, :labor_disponibility),

      nationalities:         get_value_of_record(source).validate_present?(:collection, :nationalities),
      limitations:           get_value_of_record(source).validate_present?(:collection, :limitations),
      vehicles:              get_value_of_record(source).validate_present?(:collection, :vehicles),
      driving_licences:      get_value_of_record(source).validate_present?(:collection, :driving_licences),
      offer_types:           get_value_of_record(curriculum_vitae).validate_present?(:collection, :offer_types),
      work_modes:            get_value_of_record(curriculum_vitae).validate_present?(:collection, :work_modes),
      job_categories:        get_value_of_record(curriculum_vitae).validate_present?(:collection, :job_categories),
      available_work_days:   get_value_of_record(curriculum_vitae).validate_present?(:collection, :available_work_days),

      born_state:            get_value_of_record(source).validate_present?(:state, :born_city),
      contact_number:        get_value_of_record(source).validate_present?(:contact_number, :contact_number),
      travel_disponibility:  get_value_of_record(curriculum_vitae).validate_present?(:travel_disponibility, :travel_disponibility),
      salary:                get_value_of_record(curriculum_vitae_salary).validate_present?(:salary, :salary)
    }
  end

  def give_the_profile_picture
    if curriculum_vitae.photo.attached?
      rails_routes.rails_blob_path(source.curriculum_vitae.photo, disposition: 'attachment', only_path: true )
    else
      "/assets/static/avatars/profile.jpg"
    end
  end

  def data_education
    source
      .curriculum_vitae
      .educational_levels
      .map do |level|
        {
          title: level.degree,
          institution_name: level.institution_name,
          city_id: level.city.try(:description),
          start_date: level.start_date,
          finish_date: level.finish_date,
          ongoing_study: level.ongoing_study
        }
      end
  end

  def data_experience
    source
      .curriculum_vitae
      .work_experiences
      .map do |experience|
        {
          company_name: experience.company_name,
          work_position: experience.work_position.description,
          job_category: experience.job_category.description,
          started_at: experience.started_at,
          finished_at: experience.finished_at,
          still_in_progress: experience.still_in_progress
        }
      end
  end

  def download_cv
    if source.curriculum_vitae.file_cv.attached?
      rails_routes.rails_blob_path(source.curriculum_vitae.file_cv, disposition: 'attachment')
    end
  end

  def abilities_present?
    curriculum_vitae = source.curriculum_vitae
    {
      languages_list: curriculum_vitae.languages_list.present?,
      soft_skills:    curriculum_vitae.soft_skills.present?
    }
  end

  def all_attributes_present?(attributes)
    value = attributes.values.uniq
    value.count.eql?(1) ? value.last : true
  end

  def applied_offer_data
    applied_offer = AppliedOffer.find_by(id: options[:applied_offer_id] || 0)
    if applied_offer
      {
        applied_offer_id: applied_offer.id,
        status: applied_offer.current_state,
        offer_id: applied_offer.offer_id,
        curriculum_vitae_id: curriculum_vitae.id
      }
    end
  end

  def curriculum_vitae
    source.curriculum_vitae
  end

  private

  def curriculum_vitae_salary
    curriculum_vitae.curriculum_vitae_salary
  end

  def get_value_of_record(record)
    GetValueOfRecord.new(record)
  end
end

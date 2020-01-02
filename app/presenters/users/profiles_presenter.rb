class Users::ProfilesPresenter < ApplicationPresenter

  def contact_number_with_format
    grouped_number = source
      .contact_number
      .to_s
      .match(/(\d{3})(\d{3})(\d{4})/)
    "#{grouped_number[1]} #{grouped_number[2]} #{grouped_number[3]}"
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
    if source.curriculum_vitae.photo.attached?
      rails_routes.rails_blob_path(source.curriculum_vitae.file_cv, disposition: 'attachment')
    end
  end

  def interests_present?
    curriculum_vitae = source.curriculum_vitae
    {
      job_categories: curriculum_vitae.job_categories.present?,
      contract_type:  curriculum_vitae.contract_type.present?,
      offer_types:    curriculum_vitae.offer_types.present?,
      work_modes:     curriculum_vitae.work_modes.present?
    }
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
end

module Users::CurriculumVitaes::ProfilePhotoService

  def self.call(curriculum_vitae: nil)
    execute(curriculum_vitae)
  end

  private

  def self.execute(curriculum_vitae)
    curriculum_vitae.present? && get_profile_photo_path(curriculum_vitae)
  end

  def self.get_profile_photo_path(curriculum_vitae)
    curriculum_vitae.photo.attached? ?
      Rails.application.routes.url_helpers.rails_blob_path(curriculum_vitae.photo, disposition: "attachment", only_path: true)
      : get_default_profile_photo_path(curriculum_vitae.user.sex_description)
  end

  def self.get_default_profile_photo_path(sex_description)
    sex_description.present? && sex_description.eql?('Femenino') ?
      CurriculumVitae::DEFAULT_FEMALE_USER_PROFILE_IMAGE
      : CurriculumVitae::DEFAULT_MALE_USER_PROFILE_IMAGE
  end
end
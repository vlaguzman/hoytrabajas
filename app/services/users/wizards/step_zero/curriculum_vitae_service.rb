module Users::Wizards::StepZero::CurriculumVitaeService
  def self.upload_curriculum_vitae(user, file)
    user
      .curriculum_vitae
      .file_cv
      .attach(file)
  end
end

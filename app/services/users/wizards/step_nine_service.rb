module Users::Wizards::StepNineService
  def self.call(candidate: _, update_params: {})
    cv = candidate.curriculum_vitae

    educational_level_params = update_params[:curriculum_vitae].delete(:educational_level)
    educational_level = create_educational_level(educational_level_params: educational_level_params.merge!(curriculum_vitae_id: cv.id))

    educational_level_valid(candidate, educational_level)
  end

  private

  def self.create_educational_level(educational_level_params: {})
    if educational_level_params.present?
      #TODO test without this if, with the enctype should works
      if not educational_level_params['diploma'].present?
        educational_level_params.except!(:diploma)
      end
      EducationalLevel.create(educational_level_params)
    end
  end

  def self.educational_level_valid(candidate, educational_level)
    unless(educational_level.valid?)
      candidate.errors.merge!(educational_level.errors)
    end

    candidate
  end

end
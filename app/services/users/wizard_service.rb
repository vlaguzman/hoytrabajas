module Users::WizardService

  def self.update_step(candidate: _, update_params: {})
    curriculum = candidate.curriculum_vitaes.first
    curriculum, curriculum_updated = update_curriculum_vitae(
      curriculum: curriculum,
      update_params: update_params[:curriculum_vitae]
    )

    update_params.except!(:curriculum_vitae)

    candidate, candidate_updated = update_candidate(candidate:candidate, update_params: update_params)

    if curriculum_updated && candidate_updated
      candidate
    else
      candidate.errors.details << curriculum.errors.details
      candidate
    end

  end

  private

  def self.update_candidate(candidate: _, update_params: {} )
    [candidate, candidate.update(update_params)]
  end

  def self.update_curriculum_vitae(curriculum: _, update_params: {})
    [curriculum, curriculum.update(update_params)]
  end

end
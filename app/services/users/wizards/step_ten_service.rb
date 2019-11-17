module Users::Wizards::StepTenService
  def self.call(candidate: _, update_params: {})
    cv = candidate.curriculum_vitae

    acknowledgment_params = update_params[:curriculum_vitae].delete(:acknowledgment)

    acknowledgment = create_acknowledgment(acknowledgment_params: acknowledgment_params.merge!(curriculum_vitae_id: cv.id))

    candidate
  end

  private

  def self.create_acknowledgment(acknowledgment_params: {})
    if acknowledgment_params.present?
      Acknowledgment.create(acknowledgment_params)
    end
  end

end
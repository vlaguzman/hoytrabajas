module Users::Wizards::StepThreeService
  def self.call(candidate: _, update_params: {})
    cv = candidate.curriculum_vitaes.first


    #if candidate.update(update_params) && cv.save
    #  candidate
    #else
    #  candidate.errors.details.concat(cv.errors.details)
    #  candidate
    #end

    candidate
  end

  private

  def update_curriculum_vitae(curriculum: _, update_params: _)
    
  end

end
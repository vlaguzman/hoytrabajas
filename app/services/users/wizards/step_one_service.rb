module Users::Wizards::StepOneService
  def self.call(candidate: _, update_params: {})
    cv = CurriculumVitae.new( user: candidate )

    if  candidate.update(update_params) && cv.save
      candidate
    else
      candidate.errors.details.concat(cv.errors.details)
      candidate
    end
  end

end
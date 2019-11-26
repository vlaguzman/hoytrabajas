module Companies::FirstOffer::StepTwoService

  def self.call(company: _, update_params: {})
    Companies::FirstOffer::CommonService.update_source(company, update_params)
  end
end

module Companies::FirstOffer::StepOneService
  def self.call(company: company, update_params: strong_params)
    company = company.update(strong_params)
    if company
      {status: :ok, data: company }
    else
      {status: :error, data: company }
    end
  end
end

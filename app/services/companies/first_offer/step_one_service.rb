module Companies::FirstOffer::StepOneService
  def self.call(company: company, update_params: {})
    updated = company.update!(update_params)
    if updated
      {status: :ok, data: company }
    else
      {status: :error, data: company }
    end
  end
end

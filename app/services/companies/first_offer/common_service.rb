module Companies::FirstOffer::CommonService

  def self.update_source(source = nil, update_params = {})
    first_validation = source.update(update_params)

    source_validated = Companies::FirstOffer::CompanyAndOfferErrorsService.(source, update_params: update_params)

    if first_validation && source_validated.errors.empty?
      { status: :ok, data: source_validated }
    else
      { status: :error, data: source_validated }
    end

  end

end

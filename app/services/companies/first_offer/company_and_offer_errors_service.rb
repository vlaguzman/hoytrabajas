class Companies::FirstOffer::CompanyAndOfferErrorsService < AddModelErrorsService

  VALIDATE_SINGLE_PARAMS = [

    { key: :close_date,         error_key: :blank },
    { key: :industry_id,        error_key: :blank }

  ]

  VALIDATE_COLLECTION_PARAMS = []

end

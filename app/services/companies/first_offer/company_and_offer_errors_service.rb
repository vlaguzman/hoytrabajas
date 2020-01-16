class Companies::FirstOffer::CompanyAndOfferErrorsService < AddModelErrorsService

  VALIDATE_SINGLE_PARAMS = [

     { key: :industry_id,        error_key: :blank }

  ]

  VALIDATE_COLLECTION_PARAMS = []

end

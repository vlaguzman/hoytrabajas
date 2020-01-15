class Companies::FirstOffers::CompanyErrorsService < AddModelErrorsService

  VALIDATE_SINGLE_PARAMS = [

     { key: :name,               error_key: :blank },
     { key: :contact_cellphone,  error_key: :blank }
     { key: :industry_id,        error_key: :blank }

  ]

  VALIDATE_COLLECTION_PARAMS = []

end

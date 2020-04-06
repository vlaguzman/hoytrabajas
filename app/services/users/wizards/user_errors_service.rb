class Users::Wizards::UserErrorsService < AddModelErrorsService

  VALIDATE_SINGLE_PARAMS = [
    { key: :born_city_id,       error_key: :blank },
    { key: :residence_city_id,  error_key: :blank },
    { key: :document_type_id,   error_key: :blank },
    { key: :birthday,           error_key: :blank },

  ]

  VALIDATE_COLLECTION_PARAMS = [
    {
      key: :nationality_ids,
      collection_name: :nationalities,
      error_key: :blank
    }

  ]

end

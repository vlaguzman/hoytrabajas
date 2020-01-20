class Users::Wizards::CurriculumVitaeErrorsService < AddModelErrorsService

  VALIDATE_SINGLE_PARAMS = [
    {
      key: :technical_skills,
      error_key: :invalid_skill
    },
    {
      key: :to_learn_skills,
      error_key: :invalid_skill
    }
  ]

  VALIDATE_COLLECTION_PARAMS = [
    {
      key: :job_category_ids,
      collection_name: :job_categories,
      error_key: :blank
    },
    {
      key: :soft_skill_ids,
      collection_name: :soft_skills,
      error_key: :blank
    },
    {
      key: :offer_type_ids,
      collection_name: :offer_types,
      error_key: :blank
    }
  ]
end

class Users::Wizards::CurriculumVitaeErrorsService < AddModelErrorsService

  VALIDATE_SINGLE_PARAMS = []

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
  ]

end

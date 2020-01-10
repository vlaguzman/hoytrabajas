module Users::Wizards::StepEightService
  def self.call(source: _, update_params: {})

    update_params = validate_skill_presence(source, update_params)
    update_params = validate_work_position_presence(source, update_params)

    persist_work_experience(source, params: update_params)
  end

  private

  def self.persist_work_experience(work_experience, params: {})
    [ work_experience, work_experience.update(params) ]
  end

  def self.validate_skill_presence(work_experience, update_params)

    return update_params.except(:technical_skills) if  not update_params[:technical_skills].present?

    update_params = Users::Wizards::Commons::FindOrCreateElementAssociation.(
      parent_source: work_experience,
      element_class: TechnicalSkill,
      element_key: :technical_skills,
      element_params: update_params,
      is_collection: true
    )
  end

  def self.validate_work_position_presence(work_experience, update_params)

    return update_params.except(:work_position) if  not update_params[:work_position].present?

    update_params = Users::Wizards::Commons::FindOrCreateElementAssociation.(
      parent_source: work_experience,
      element_class: WorkPosition,
      element_key: :work_position,
      element_params: update_params,
      is_collection: false
    )

  end


end
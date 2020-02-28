module AffinityPercentages::CreateOrUpdateAffinityPercentagesService

  def self.call
    curriculum_vitaes = CurriculumVitae.all

    Offer.active.map do |offer|
      curriculum_vitaes.map do |curriculum_vitae|
        create_if_has_data(offer, curriculum_vitae)
      end
    end
  end

  def try_data(object, method)
    object.present? ? object.send(method) : nil
  end

  def clean_array(array)
    array.eql?([]) ? nil : array.join(", ")
  end

  def create_if_has_data(offer, curriculum_vitae)
    if (offer.present? && curriculum_vitae.present?)
      create_affinity_percentage(offer, curriculum_vitae)
    else
      puts("Error when create affinity percentage with convination -> offer_id = #{offer.id}; curriculum_vitae_id = #{curriculum_vitae}, NO HAS DATA")
    end
  end

  def create_affinity_percentage(offer, curriculum_vitae)
    affinity_percentage_data = {
      offer_id:            offer.id,
      curriculum_vitae_id: curriculum_vitae.id,
      affinity_percentage: AffinityCalculator.new(offer, curriculum_vitae.user).affinity_percentage,
      version:             AffinityCalculator::VERSION,
  
      sexes_offer:                          clean_array(offer.sexes.pluck(:description)),
      sexes_curriculum_vitae:               try_data(curriculum_vitae.user.sex, :description),
      available_work_days_offer:            clean_array(offer.available_work_days.pluck(:description)),
      available_work_days_curriculum_vitae: clean_array(curriculum_vitae.available_work_days.pluck(:description)),
      educational_degree_offer:             try_data(EducationalDegree.find_by(id: offer.educational_degree_id), :description),
      educational_degree_curriculum_vitae:  try_data(curriculum_vitae.user.educational_degree, :description),
      educational_level_offer:              clean_array(offer.educational_level.pluck(:degree)),
      educational_level_curriculum_vitae:   clean_array(curriculum_vitae.educational_levels.pluck(:degree)),
      driving_licences_offer:               clean_array(offer.driving_licences.pluck(:description)),
      driving_licences_curriculum_vitae:    clean_array(curriculum_vitae.user.driving_licences.pluck(:description)),
      technical_skills_offer:               clean_array(offer.technical_skills.pluck(:description)),
      technical_skills_curriculum_vitae:    clean_array(curriculum_vitae.technical_skills.map{|ts| try_data(TechnicalSkill.find_by(id: ts.technical_skill_id), :description)}),
      contract_type_id_offer:               try_data(offer.contract_type, :description),
      contract_type_id_curriculum_vitae:    try_data(curriculum_vitae.contract_type, :description),
      to_learn_skills_offer:                nil,
      to_learn_skills_curriculum_vitae:     nil,
      languages_list_offer:                 clean_array(offer.languages.pluck(:description)),
      languages_list_curriculum_vitae:      clean_array(curriculum_vitae.languages_list.map{|cv_language| try_data(cv_language.language, :description) }),
      job_categories_offer:                 clean_array(offer.job_categories.pluck(:description)),
      job_categories_curriculum_vitae:      clean_array(curriculum_vitae.job_categories.pluck(:description)),
      working_days_offer:                   clean_array(offer.working_days.pluck(:description)),
      working_days_curriculum_vitae:        clean_array(curriculum_vitae.working_days.pluck(:description)),
      work_mode_id_offer:                   try_data(offer.work_mode, :description),
      work_mode_id_curriculum_vitae:        clean_array(curriculum_vitae.work_modes.pluck(:description)),
      soft_skills_offer:                    clean_array(offer.soft_skills.pluck(:description)),
      soft_skills_curriculum_vitae:         clean_array(curriculum_vitae.soft_skills.pluck(:description)),
      vehicles_offer:                       clean_array(offer.vehicles.pluck(:description)),
      vehicles_curriculum_vitae:            clean_array(curriculum_vitae.user.vehicles.pluck(:description)),
      city_id_offer:                        try_data(offer.city, :description),
      city_id_curriculum_vitae:             try_data(curriculum_vitae.city, :description)
    }

    affinity_percentage = AffinityPercentage.new(affinity_percentage_data)

    if affinity_percentage.save
      puts "Created succesfully affinity percentage #{affinity_percentage.id}"
    else
      puts "Error has occurred when create affinity_percentage of applied offer -> #{affinity_percentage.id}, error details -> #{affinity_percentage.errors.details}"
    end
  end

end

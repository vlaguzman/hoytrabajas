module AffinityPercentages::CreateAffinityPercentagesService
  #TODO: When 'to learn skills' has been defined put in offer and curriculum_vitae hashes

  def self.call
    curriculum_vitaes = CurriculumVitae.all

    Offer.active.map do |offer|
      curriculum_vitaes.map do |curriculum_vitae|

        affinity_percentage = last_affinity_percentage(offer.id, curriculum_vitae.id)
        validate_affinity_percentage(offer, curriculum_vitae, affinity_percentage)
      end
    end
  end

  def self.last_affinity_percentage(offer_id, curriculum_vitae_id)
    AffinityPercentage.get_last(offer_id, curriculum_vitae_id)
  end

  def self.validate_offer_and_cv_updated?(offer, curriculum_vitae, affinity_percentage)
    dates_to_compare = [offer.updated_at, curriculum_vitae.updated_at, curriculum_vitae.user.updated_at]
    dates_to_compare.map{ |date| date > affinity_percentage.created_at }.uniq.include?(true)
  end

  def self.validate_affinity_percentage(offer, curriculum_vitae, affinity_percentage)
    if affinity_percentage && validate_offer_and_cv_updated?(offer, curriculum_vitae, affinity_percentage)
      create_affinity_percentage(offer, curriculum_vitae)
    elsif not affinity_percentage
      create_affinity_percentage(offer, curriculum_vitae)
    else
      return {};
    end
  end

  def self.try_data(object, method)
    object.present? ? object.send(method) : nil
  end

  def self.array_to_string(array)
    array.any? ? array.join(", ") : nil
  end

  def self.curriculum_vitae_for_affinity_percentage(curriculum_vitae)
    {
      available_work_days_curriculum_vitae: array_to_string(curriculum_vitae.available_work_days.pluck(:description)),
      educational_degree_curriculum_vitae:  try_data(curriculum_vitae.user.educational_degree, :description),
      driving_licences_curriculum_vitae:    array_to_string(curriculum_vitae.user.driving_licences.pluck(:description)),
      technical_skills_curriculum_vitae:    array_to_string(curriculum_vitae.technical_skills.map{|ts| try_data(TechnicalSkill.find_by(id: ts.technical_skill_id), :description)}),
      contract_type_id_curriculum_vitae:    try_data(curriculum_vitae.contract_type, :description),
      languages_list_curriculum_vitae:      array_to_string(curriculum_vitae.languages_list.map{|cv_language| try_data(cv_language.language, :description) }),
      job_categories_curriculum_vitae:      array_to_string(curriculum_vitae.job_categories.pluck(:description)),
      working_days_curriculum_vitae:        array_to_string(curriculum_vitae.working_days.pluck(:description)),
      work_mode_id_curriculum_vitae:        array_to_string(curriculum_vitae.work_modes.pluck(:description)),
      soft_skills_curriculum_vitae:         array_to_string(curriculum_vitae.soft_skills.pluck(:description)),
      vehicles_curriculum_vitae:            array_to_string(curriculum_vitae.user.vehicles.pluck(:description)),
      city_id_curriculum_vitae:             try_data(curriculum_vitae.city, :description),
      sexes_curriculum_vitae:               try_data(curriculum_vitae.user.sex, :description)
    }
  end

  def self.offer_for_affinity_percentage(offer)
    {
      available_work_days_offer: array_to_string(offer.available_work_days.pluck(:description)),
      educational_degree_offer:  try_data(EducationalDegree.find_by(id: offer.educational_degree_id), :description),
      driving_licences_offer:    array_to_string(offer.driving_licences.pluck(:description)),
      technical_skills_offer:    array_to_string(offer.technical_skills.pluck(:description)),
      contract_type_id_offer:    try_data(offer.contract_type, :description),
      languages_list_offer:      array_to_string(offer.languages.pluck(:description)),
      job_categories_offer:      array_to_string(offer.job_categories.pluck(:description)),
      working_days_offer:        array_to_string(offer.working_days.pluck(:description)),
      work_mode_id_offer:        try_data(offer.work_mode, :description),
      soft_skills_offer:         array_to_string(offer.soft_skills.pluck(:description)),
      vehicles_offer:            array_to_string(offer.vehicles.pluck(:description)),
      city_id_offer:             try_data(offer.city, :description),
      sexes_offer:               array_to_string(offer.sexes.pluck(:description))
    }
  end

  def self.create_affinity_percentage(offer, curriculum_vitae)
    affinity_percentage_data = {
      offer_id:            offer.id,
      curriculum_vitae_id: curriculum_vitae.id,
      affinity_percentage: AffinityCalculator.new(offer, curriculum_vitae.user).affinity_percentage,
      version:             AffinityCalculator::VERSION,

    }.merge(
        offer_for_affinity_percentage(offer),
        curriculum_vitae_for_affinity_percentage(curriculum_vitae)
      )

    affinity_percentage = AffinityPercentage.new(affinity_percentage_data)
    persist_affinity_percentage(affinity_percentage)
  end

  def self.persist_affinity_percentage(affinity_percentage)
    offer_id = affinity_percentage.offer_id
    cv_id    = affinity_percentage.curriculum_vitae_id
    affinity_percentages_logger = Logger.new("#{Rails.root}/log/affinity_percentages.log")

    if affinity_percentage.save
      affinity_percentage
    else
      affinity_percentages_logger.error("OFFER_ID:#{offer.id} CURRICULUM_VITAE_ID: #{curriculum_vitae.id}, ERROR DETAILS #{affinity_percentage.errors.details}")
      affinity_percentage
    end
  end
end

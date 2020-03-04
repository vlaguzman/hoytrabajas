module AffinityPercentages::CreateAffinityPercentagesService
  #TODO: When to learn skills has been defined put in offer and curriculum_vitae

  def self.call
    curriculum_vitaes = CurriculumVitae.all

    Offer.active.map do |offer|
      curriculum_vitaes.map do |curriculum_vitae|

        affinity_percentage = get_last_affinity_percentage(offer.id, curriculum_vitae.id)
        validate_affinity_percentage(offer, curriculum_vitae, affinity_percentage)
      end
    end
  end

  def self.get_last_affinity_percentage(offer_id, curriculum_vitae_id)
    AffinityPercentage.where(offer_id: offer_id, curriculum_vitae_id: curriculum_vitae_id).last
  end

  def self.validate_if_offer_and_cv_updated?(offer, curriculum_vitae, affinity_percentage)
    (convert_date(offer.updated_at)                 != convert_date(affinity_percentage.created_at)) ||
    (convert_date(curriculum_vitae.updated_at)      != convert_date(affinity_percentage.created_at)) ||
    (convert_date(curriculum_vitae.user.updated_at) != convert_date(affinity_percentage.created_at))
  end

  def self.validate_affinity_percentage(offer, curriculum_vitae, affinity_percentage)
    if affinity_percentage && validate_if_offer_and_cv_updated?(offer, curriculum_vitae, affinity_percentage)
      prepare_affinity_percentage(offer, curriculum_vitae)
    elsif not affinity_percentage
      prepare_affinity_percentage(offer, curriculum_vitae)
    else
      return {};
    end
  end

  def self.try_data(object, method)
    object.present? ? object.send(method) : nil
  end

  def self.clean_array(array)
    array.any? ? array.join(", ") : nil
  end

  def self.convert_date(date)
    date.strftime("%F")
  end

  def self.curriculum_vitae_for_affinity_percentage(curriculum_vitae)
    {
      available_work_days_curriculum_vitae: clean_array(curriculum_vitae.available_work_days.pluck(:description)),
      educational_degree_curriculum_vitae:  try_data(curriculum_vitae.user.educational_degree, :description),
      driving_licences_curriculum_vitae:    clean_array(curriculum_vitae.user.driving_licences.pluck(:description)),
      technical_skills_curriculum_vitae:    clean_array(curriculum_vitae.technical_skills.map{|ts| try_data(TechnicalSkill.find_by(id: ts.technical_skill_id), :description)}),
      contract_type_id_curriculum_vitae:    try_data(curriculum_vitae.contract_type, :description),
      languages_list_curriculum_vitae:      clean_array(curriculum_vitae.languages_list.map{|cv_language| try_data(cv_language.language, :description) }),
      job_categories_curriculum_vitae:      clean_array(curriculum_vitae.job_categories.pluck(:description)),
      working_days_curriculum_vitae:        clean_array(curriculum_vitae.working_days.pluck(:description)),
      work_mode_id_curriculum_vitae:        clean_array(curriculum_vitae.work_modes.pluck(:description)),
      soft_skills_curriculum_vitae:         clean_array(curriculum_vitae.soft_skills.pluck(:description)),
      vehicles_curriculum_vitae:            clean_array(curriculum_vitae.user.vehicles.pluck(:description)),
      city_id_curriculum_vitae:             try_data(curriculum_vitae.city, :description),
      sexes_curriculum_vitae:               try_data(curriculum_vitae.user.sex, :description)
    }
  end

  def self.offer_for_affinity_percentage(offer)
    {
      available_work_days_offer: clean_array(offer.available_work_days.pluck(:description)),
      educational_degree_offer:  try_data(EducationalDegree.find_by(id: offer.educational_degree_id), :description),
      driving_licences_offer:    clean_array(offer.driving_licences.pluck(:description)),
      technical_skills_offer:    clean_array(offer.technical_skills.pluck(:description)),
      contract_type_id_offer:    try_data(offer.contract_type, :description),
      languages_list_offer:      clean_array(offer.languages.pluck(:description)),
      job_categories_offer:      clean_array(offer.job_categories.pluck(:description)),
      working_days_offer:        clean_array(offer.working_days.pluck(:description)),
      work_mode_id_offer:        try_data(offer.work_mode, :description),
      soft_skills_offer:         clean_array(offer.soft_skills.pluck(:description)),
      vehicles_offer:            clean_array(offer.vehicles.pluck(:description)),
      city_id_offer:             try_data(offer.city, :description),
      sexes_offer:               clean_array(offer.sexes.pluck(:description))
    }
  end

  def self.prepare_affinity_percentage(offer, curriculum_vitae)
    affinity_percentage_data = {
      offer_id:            offer.id,
      curriculum_vitae_id: curriculum_vitae.id,
      affinity_percentage: AffinityCalculator.new(offer, curriculum_vitae.user).affinity_percentage,
      version:             AffinityCalculator::VERSION,

    }.merge!(
        offer_for_affinity_percentage(offer),
        curriculum_vitae_for_affinity_percentage(curriculum_vitae)
      )

    affinity_percentage = AffinityPercentage.new(affinity_percentage_data)
    create_affinity_percentage(affinity_percentage)
  end

  def self.create_affinity_percentage(affinity_percentage)
    offer_id = affinity_percentage.offer_id
    cv_id    = affinity_percentage.curriculum_vitae_id
    affinity_percentages_logger = Logger.new("#{Rails.root}/log/affinity_percentages.log")

    if affinity_percentage.save
      return {};
    else
      affinity_percentages_logger.error("OFFER_ID:#{offer.id} CURRICULUM_VITAE_ID: #{curriculum_vitae.id}, ERROR DETAILS #{affinity_percentage.errors.details}")
      return {offer_id: offer_id, curriculum_vitae_id: cv_id, error_details: affinity_percentage.errors.details};
    end
  end
end

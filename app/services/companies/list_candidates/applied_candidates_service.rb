module Companies::ListCandidates::AppliedCandidatesService

  def self.call(offer: nil)
    execute(offer)
  end

  private

  def self.execute(offer)
    offer.present? && build_applied_candidates_list(offer)
  end

  def self.build_applied_candidates_list(offer)
    AppliedOffer.where(offer: offer).order_by_applied_date.map do |applied_offer|
      build_applied_candidate(offer, applied_offer.curriculum_vitae)
    end
  end

  def self.build_applied_candidate(offer, curriculum_vitae)

    candidate = curriculum_vitae.user

    {
      name: build_name(candidate),
      location: build_location(candidate),
      technical_skills: technical_skills(curriculum_vitae),
      affinity_percentage: build_affinity_percentage(offer: offer, candidate: candidate),
      profile_path: profile_path(candidate, curriculum_vitae.id, offer.id),
      avatar: Users::CurriculumVitaes::ProfilePhotoService.(curriculum_vitae: curriculum_vitae)
    }
  end

  def self.build_name(candidate)
    "#{candidate.name} #{candidate.last_name}"
  end

  def self.build_location(candidate)
    city = candidate.residence_city
    city.present? && "#{city.description}, #{city.state_description}"
  end

  def self.technical_skills(curriculum_vitae)
    curriculum_vitae.strong_skills.any? && curriculum_vitae.strong_skills.map { |skill| skill.technical_skill }.pluck(:description).join(", ")
  end

  def self.build_affinity_percentage(offer: nil, candidate: nil)
    offer.present? && candidate.present? && AffinityCalculator.new(offer, candidate).affinity_percentage.to_i
  end

  def self.profile_path(user_id, curriculum_vitae_id = '', offer_id = '')
    applied_offer = curriculum_vitae_id && offer_id && AppliedOffer.find_by(curriculum_vitae_id: curriculum_vitae_id, offer_id: offer_id)
  
    if applied_offer
      Rails.application.routes.url_helpers.users_profile_path(user_id: user_id, applied_offer_id: applied_offer.id)
    else
      Rails.application.routes.url_helpers.users_profile_path(user_id: user_id)
    end
  end

end

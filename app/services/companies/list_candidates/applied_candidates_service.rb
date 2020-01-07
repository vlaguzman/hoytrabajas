module Companies::ListCandidates::AppliedCandidatesService

  def self.call(offer: nil)
    execute(offer)
  end

  private

  def self.execute(offer)
    offer.present? && build_applied_candidates_list(offer)
  end

  def self.build_applied_candidates_list(offer)
    AppliedOffer.where(offer: offer).map do |applied_offer|
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
      profile_path: profile_path(user_id: candidate.id),
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
    offer.present? && candidate.present? && "#{AffinityCalculator.new(offer, candidate).affinity_percentage.to_i}%"
  end

  def self.profile_path(candidate)
    Rails.application.routes.url_helpers.users_profile_path(candidate)
  end

end

module Companies::FirstOffer::StepSevenService

  def self.call(company: _, update_params: {})
    offer = Offer.find_by(id: update_params[:id])

    technical_skills_params = update_params.delete(:technical_skills)
    update_skills(offer, technical_skills_params)

    languages_params = update_params.delete(:languages)
    update_languages(offer, languages_params: languages_params)

    update_experieces(offer, update_params)

    persist_offer(offer, update_params)
  end

  def self.update_skills(offer, technical_skills_params)
    technical_skills_params
      .select {|skill| not skill.value?("") }
      .map { |skill| skill.merge(offer_id: offer.id) }
      .each do |skill|
        OffersTechnicalSkills.create(skill)
      end
  end

  def self.update_languages(offer, languages_params: [])
    languages_params
      .select {|language| not language.value?("") }
      .map { |language| language.merge(offer_id: offer.id) }
      .each do |language|
        LanguagesOffers.create(language)
      end
  end

  def self.update_experieces(offer, update_params)
    RequiredExperience.create(
      offer_id: offer.id,
      duration_type_id: update_params[:duration_type_id],
      duration: update_params[:duration]
    )
  end

  def self.persist_offer(offer, params)
    updated = update_offer(offer, params)
    if updated
      { status: :ok, data: offer }
    else
      { status: :error, data: offer }
    end
  end

  def self.update_offer(offer, update_params)
    offer.update(
      city_id: update_params[:city_id],
      educational_degree_id: update_params[:educational_degree_id],
      required_experience: update_params[:required_experience]
    )
  end

end

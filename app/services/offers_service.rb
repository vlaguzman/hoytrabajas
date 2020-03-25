# module only to list offers and offers asoc to other models
module OffersService

  def active_on_demand_most_recently_created
    OfferOnDemand
      .active
      .most_recently_offer_created
      .map { |on_demand| on_demand.offer }
  end

  def applied_offer_by_curriculum_id(curriculum_vitae_id = nil)
    AppliedOffer
      .where(curriculum_vitae_id: curriculum_vitae_id)
      .most_recently_offer_created
      .map { |on_demand| on_demand.offer }
  end

  def active_most_recently_created(limit: nil)
    Offer
      .active
      .most_recently_created
      .limit(limit)
  end

  def ids_extractor(list = [])
    list.pluck(:id)
  end

##

  #TODO remove
  def self.active_offers_index_details(current_user = nil, limited = Home::HomePresenter::MAX_OFFER_LIMIT)
    cv_id = current_user.present? ? current_user.curriculum_vitae.id : 0
    Offer
      .active
      .most_recently_created
      .limit(limited) # TODO Oscar temporal limite to reduce query time
      .not_applied_offers_by_cv(cv_id)
      .order_by_demand_and_created_at(current_user: current_user)
      .map{ |offer| Offers::IndexService.new(offer, current_user).details }
  end











  #TODO remove in next PRspec/services/offers/organizer/details_builder_spec.rb:12
  #dont touch yet

  def self.related_offers_show_details(id = nil, job_categories = [], current_user = nil)
    cv_id = current_user.present? ? current_user.curriculum_vitae.id : 0
    Offer
      .most_recently_created
      .not_applied_offers_by_cv(cv_id)
      .active
      .most_recently_created
      .related_job_category(job_categories.pluck(:id))
      .first(10)
      .reject { |offer| offer.id.eql?(id) }
      .map { |offer| Offers::IndexService.new(offer, current_user).details }
  end

  def self.query_offers_home(query, ids_categories, current_user: nil)
    if ids_categories.present?
      ordered_by_on_demand = query
        .order_by_on_demand_created_at
        .by_job_categories(ids_categories.split(","))
    else
      query.order_by_on_demand_created_at
    end
  end
end

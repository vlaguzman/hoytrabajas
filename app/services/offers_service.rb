module OffersService


  def self.active_offers_index_details(current_user = nil, limited = Home::HomePresenter::MAX_OFFER_LIMIT)
    cv_id = current_user.present? ? current_user.curriculum_vitae.id : 0
    Offer
      .active
      .limit(limited * 3 ) # TODO Oscar temporal limite to reduce query time
      .not_applied_offers_by_cv(cv_id)
      .order_by_demand_and_created_at(current_user: current_user)
      .map{ |offer| Offers::IndexService.new(offer, current_user).details }
  end

  def self.related_offers_show_details(id = nil, job_categories = [], current_user = nil)
    cv_id = current_user.present? ? current_user.curriculum_vitae.id : 0
    Offer.not_applied_offers_by_cv(cv_id)
      .active
      .created_at_desc
      .related_job_category(job_categories.pluck(:id))
      .first(10)
      .reject { |offer| offer.id.eql?(id) }
      .map { |offer| Offers::IndexService.new(offer, current_user).details }
  end

  def self.query_offers_home(query, ids_categories, current_user: nil)
    if ids_categories.present?
      ordered_by_on_demand = query
        .order_by_on_demand_and_created_at
        .by_job_categories(ids_categories.split(","))
    else
      query.order_by_on_demand_and_created_at
    end
  end
end

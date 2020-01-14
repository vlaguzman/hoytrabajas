module OffersService

  def self.active_offers_index_details(current_user = nil, limited = nil)
    cv_id = current_user.present? ? current_user.curriculum_vitae.id : 0
    Offer
      .active
      .not_applied_offers_by_cv(cv_id)
      .order_by_demand_and_created_at
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

  def self.query_offers_home(query, ids_categories)
    if ids_categories.present?
      query
        .by_job_categories(ids_categories.split(","))
        .order_by_on_demand_and_created_at
    else
      query.order_by_on_demand_and_created_at
    end
  end
end

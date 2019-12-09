module OffersService

  def self.active_offers_index_details(current_user = nil, limited = nil)
    cv_id = current_user.present? ? current_user.curriculum_vitae.id : 0
    Offer
      .max_offers(limited)
      .active
      .created_at_desc
      .not_applied_offers_by_cv(cv_id)
      .map{|offer| Offers::IndexService.new(offer, current_user).details }
  end

  def self.related_offers_show_details(id = nil, job_categories = [], current_user = nil)
    cv_id = current_user.present? ? current_user.curriculum_vitae.id : 0
    not_applied_offers(cv_id)
      .active
      .related_job_category(job_categories.pluck(:id))
      .sample(10)
      .reject { |offer| offer.id.eql?(id) }
      .map { |offer| Offers::IndexService.new(offer, current_user).details }
  end

  def self.query_offers_home(query, ids_categories)
    if ids_categories.present?
      query.by_job_categories(ids_categories.split(","))
    else
      query
    end
  end

  private

  def self.not_applied_offers(cv_id)
    ids = Offer.not_applied_offers_by_cv(cv_id).map(&:id)
    Offer.where(id: ids)
  end

end

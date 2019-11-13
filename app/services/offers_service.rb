module OffersService

  def self.active_offers_index_details(current_user=nil)
    cv_id = current_user.present? ? current_user.curriculum_vitae.id : 0
    Offer
      .active
      .not_applied_offers_by_cv(cv_id)
      .map{|offer| Offers::IndexService.new(offer, current_user).details }
  end

  def self.related_offers_show_details(id=nil, job_category_id=nil, current_user=nil)
    Offer
      .active
      .related_job_category(job_category_id)
      .sample(10)
      .reject { |offer| offer.id.eql?(id) }
      .map { |offer| Offers::IndexService.new(offer, current_user).details }
  end

end

class Companies::ListCandidatesPresenter < ApplicationPresenter

  def location
    source.city_description
  end

  def categories
    source.job_categories.pluck(:description)
  end

  def pretty_close_date
    DatesManager.default(date: source.close_date)
  end

  def pretty_applied_candidades
    "#{applied_candidades} #{I18n.t('companies.list_candidates.show.candidates')}"
  end

  def list_applied_candidates
    Companies::ListCandidates::AppliedCandidatesService.(offer: source)
  end

  def offer_path
    rails_routes.offer_path(source)
  end

  private

  def applied_candidades
    AppliedOffer.where(offer: source).count
  end

end
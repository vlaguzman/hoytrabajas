class Companies::ListCandidatesPresenter < ApplicationPresenter

  def location
    source.city_description
  end

  def categories
    source.job_categories.pluck(:description)
  end

  def pretty_close_date
    source.close_date.present? ? DatesManager.default(date: source.close_date) : '-'
  end

  def pretty_applied_candidates
    "#{applied_candidates} #{I18n.t('companies.list_candidates.show.candidates')}"
  end

  def pretty_not_interested_candidates
    if not_interested_candidates > 0
      "#{not_interested_candidates} #{I18n.t('companies.list_candidates.show.not_interested')}"
    end
  end

  def list_applied_candidates
    Companies::ListCandidates::AppliedCandidatesService.(offer: source)
     .sort_by { |attribute, _| -(attribute[:affinity_percentage]) }
  end

  def offer_path
    rails_routes.offer_path(source)
  end

  private

  def applied_candidates
    AppliedOffer.where(offer: source).count
  end

  def not_interested_candidates
    AppliedOffer.where(offer: source).in_state(:not_interested).count
  end

end

class Offers::JobCategoriesController < ApplicationController

  def show
    offers_presenter

    render 'offers/index'
  end

  private

  def job_category_id
    job_category = JobCategory.by_unaccent_description(params.permit(:id)[:id]).last
    job_category.present? && job_category.id
  end

  def offers_presenter
    offers__by_category = Offer
      .active
      .related_job_category([job_category_id])

    @offers = Offers::OrderByOnDemand.(offers: offers__by_category)
      .map { |offer| Offers::IndexService.new(offer, current_user).details }
  end

end
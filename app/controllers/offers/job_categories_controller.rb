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
    @offers = Offer
      .active
      .related_job_category([job_category_id])
      .map { |offer| Offers::IndexService.new(offer, current_user).details }
  end

end
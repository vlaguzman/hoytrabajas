class Offers::JobCategoriesController < ApplicationController

  def show
    offers_presenter

    render 'offers/index'
  end

  private

  def sanitized_job_category_name
    params.permit(:id)[:id]
  end

  def job_category_name
    StringConverter.replace_chars_to(sanitized_job_category_name, char_to_replace: "-", new_char: " ")
  end

  def job_category_id
    job_category = JobCategory.by_unaccent_description(job_category_name).last
    job_category.present? && job_category.id
  end

  def offers_presenter
    offers__by_category = Offer
      .active
      .related_job_category([job_category_id])

    offers_by_affinity = Offers::OrderByAffinityPercentageService.(current_user: current_user, offers: offers__by_category)

    offers_list = Offers::OrderByOnDemand.(offers: offers_by_affinity)
      .map { |offer| Offers::IndexService.new(offer, current_user).details }

    @offers = {
      offers_list: offers_list,
      origin: :job_categories,
      content: sanitized_job_category_name,
      adtional_title_description: "#{t('in')} #{job_category_name}"
    }
  end

end
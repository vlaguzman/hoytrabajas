class Offers::JobCategoriesController < ApplicationController

  def show
    @offers = offers_presenter

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

    OffersPresenter.new(nil,
      current_user: current_user,
      search_parameters: { job_categories: [job_category_id] },
      origin: :job_categories,
      content: sanitized_job_category_name,
      adtional_title_description: "#{t('in')} #{job_category_name}"
    )

  end

end
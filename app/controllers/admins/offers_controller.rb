class Admins::OffersController < ApplicationController
  before_action :authenticate_admin_user!

  def edit
    offer = Offer.find(sanitize_offer_id)
    offer_presenter(offer)
  end

  def update
    offer = Admins::OffersService.(update_params: update_params)

    if offer[:status].eql?(:error)
      flash[:error] = offer[:data].errors.full_messages
      offer_presenter(offer[:data])
      render :edit
    else
      redirect_to admin_offer_path(offer[:data].id)
      flash[:notice] = t('offer.form.messages.succesfully_update', offer_title: offer[:data].title)
    end
  end

  private

  def offer_presenter(offer)
    @offer = Admins::OffersPresenter.new(offer)
  end

  def sanitize_offer_id
    params.permit(:id)[:id]
  end

  def update_params
    params
      .require(:offer)
      .permit(
        :id,
        :title,
        :description,
        :vacancies_quantity,
        :offer_type_id,
        :work_mode_id,
        :contract_type_id,
        :city_id,
        :educational_degree_id,
        :close_date,
        :immediate_start,
        :required_experience,
        :status,
        age_range: [
          :to,
          :from,
          :offer_id
        ],
        offer_salary: [
          :to,
          :from,
          :is_range,
          :offer_id,
          :salary_period_id,
          :currency_id
        ],
        offer_required_experiences: [
          :duration,
          :duration_type_id,
          :offer_id
        ],
        offers_technical_skills: [
          :technical_skill_id,
          :level_id,
          :offer_id
        ],
        languages_offers: [
          :language_id,
          :level_id,
          :offer_id
        ],
        job_categories: [],
        work_positions: [],
        sexes: [],
        available_work_days: [],
        working_days: [],
        job_aids: [],
        responsibilities: [],
        requirements: [],
        vehicles: [],
        driving_licences: []
    ).to_h
  end
end

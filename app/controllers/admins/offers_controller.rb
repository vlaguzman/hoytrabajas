class Admins::OffersController < ApplicationController
  before_action :authenticate_admin_user!

  def edit
    offer = Offer.find(edit_params[:offer_id])
    offer_presenter(offer)
  end

  def update
    offer = Admins::OffersService.(update_params: update_params)
    if offer[:status].eql?(:error)
      redirect_to admin_offers_path
      flash[:error] = offer[:data].errors.full_messages
    else
      redirect_to admin_offers_path
      flash[:notice] = t('offer.form.messages.succesfully_update', offer_title: offer[:data].title)
    end
  end

  private

  def offer_presenter(offer)
   @offer = Admins::OffersPresenter.new(offer)
  end

  def edit_params
    params.permit(:offer_id)
  end

  def update_params
    params
      .require(:offer)
      .permit(
        :id,
        :title,
        :vacancies_quantity,
        :offer_type_id,
        :work_mode_id,
        :contract_type_id,
        :city_id,
        :educational_degree_id,
        :close_date,
        :immediate_start,
        :required_experience,
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

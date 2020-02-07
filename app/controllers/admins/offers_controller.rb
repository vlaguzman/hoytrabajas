class Admins::OffersController < ApplicationController
  before_action :authenticate_admin_user!

  def edit
    offer = Offer.find(sanitize_offer_id)
    offer_presenter(offer)
  end

  def update
    response = Admins::OffersService.(update_params: update_params)

    if response[:status].eql?(:error)
      offer_presenter(response[:data])
      render :edit
    else
      redirect_to admin_offer_path(response[:data].id)
      flash[:notice] = t('offer.form.messages.succesfully_update', offer_title: response[:data].title)
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
        :offer_confidential,
        age_range: [
          :to,
          :from
        ],
        offer_salary: [
          :to,
          :from,
          :is_range,
          :salary_period_id,
          :currency_id
        ],
        offer_required_experiences: [
          :duration,
          :duration_type_id
        ],
        offers_technical_skills: [[
          :id,
          :technical_skill_id,
          :level_id
        ]],
        languages_offers: [[
          :id,
          :language_id,
          :level_id
        ]],
        job_categories: [],
        work_positions: [],
        sexes: [],
        available_work_days: [],
        working_days: [],
        job_aids: [],
        # TODO uncomment when responsibilities and requirements has been defined
        #responsibilities: [],
        #requirements: [],
        vehicles: [],
        driving_licences: []
    ).to_h
  end
end

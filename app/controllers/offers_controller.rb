class OffersController < ApplicationController
  MAX_OFFER_LIMIT = 50

  def index
    query = Offer.active.ransack(index_params[:q])
    if index_params[:q].present?
      results_query = query.result(distinct: true)
      query_with_filter_categories = OffersService.query_offers_home(results_query, index_params[:q][:job_category_ids], current_user: current_user)
      @offers = {
        offers_list: query_with_filter_categories.map { |offer| Offers::IndexService.new(offer, current_user).details },
        origin: :default
      }
    else
      @offers = {
        offers_list: OffersService.active_offers_index_details(current_user, MAX_OFFER_LIMIT),
        origin: :default
      }
    end
  end

  def show
    offer = Offer.find_by(id: sanatized_offer_id)

    @offer = Offers::ShowPresenter.new(offer, current_user: current_user, current_company: current_company)
  end

  def update
    offer = Offer.find_by(id: sanatized_offer_update_params[:id])
    offer.update(status: sanatized_offer_update_params[:status])
    redirect_to offer_path(offer)
  end

  private

  def offer_show
    OffersPresenter.new(Offer.find_by(id: show_params[:id]), current_user)
  end

  def index_params
    params.permit(
      {
        q: [
          :title_cont,
          :job_category_ids,
          :city_id_eq
        ]
      }
    )
  end

  def sanatized_offer_id
    params.permit(:id)[:id]
  end


  def sanatized_offer_update_params
    params.permit(
      :id,
      :status
    ).to_h
  end
end

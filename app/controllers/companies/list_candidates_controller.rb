class Companies::ListCandidatesController < ApplicationController
  before_action :authenticate_company!

  def show
    offer_presenter
  end

  private

  def offer_presenter
    @offer = Companies::ListCandidatesPresenter.new(Offer.find_by(offer_id))
  end

  def offer_id
    params.permit(:id)
  end

end

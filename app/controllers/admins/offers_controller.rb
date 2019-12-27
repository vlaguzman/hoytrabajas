class Admins::OffersController < ApplicationController
  before_action :authenticate_admin_user!

  def edit
    offer = Offer.find(edit_params[:offer_id])
    offer_presenter(offer)
  end

  def update
    puts "+" * 100
    puts params.inspect
  end

  private

  def offer_presenter(offer)
   @offer = Admins::OffersPresenter.new(offer)
  end

  def edit_params
    params.permit(:offer_id)
  end

  def update_params
    params.require(:offer).permit(:title, :job_categories)
  end
end

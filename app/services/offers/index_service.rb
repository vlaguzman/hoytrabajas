class Offers::IndexService < Offers::ViewsService

  attr_accessor :offer, :current_user

  def initialize(offer, current_user=nil)
    super(offer, current_user)
  end

  private

  def build_details
    super().merge(
    {
      new_offer:            offer.created_at > 24.hours.ago
    })
  end

end

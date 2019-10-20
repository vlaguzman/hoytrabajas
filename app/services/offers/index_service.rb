class Offers::IndexService < Offers::ViewsService

  def initialize(offer)
    super(offer)
  end

  private

  def build_details
    super().merge(
    {
      new_offer:            offer.created_at > 24.hours.ago
    })
  end

end

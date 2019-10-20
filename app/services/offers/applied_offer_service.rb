class Offers::AppliedOfferService
  def self.call(user: _, params_offer: {})
    total_data = params_offer
      .merge(
        curriculum_vitae_id: user.curriculum_vitae_ids.last.to_i,
        applied_offer_status_id: AppliedOfferStatus.find_by(description: 'applied').id,
        applied_date: DateTime.now
      )
    create_applied_offer(total_data)
  end

  def self.create_applied_offer(total_data)
    applied_offer = AppliedOffer.new(total_data).save
    if applied_offer
      { status: :ok }
    else
      { status: :error }
    end
  end
end

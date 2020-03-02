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
    AppliedOffer.new(total_data).save
  end

  def self.applied_offer_verification(applied_offer_data)
    applied_offer = AppliedOffer.find_by(curriculum_vitae_id: applied_offer_data[:curriculum_vitae_id], offer_id: applied_offer_data[:offer_id])
    status_error = {
      status: "error"
    }

    if applied_offer && applied_offer_data[:applied_offer_id].eql?(applied_offer.id) && applied_offer.state_machine.transition_to!(applied_offer_data[:action])
      {
        status: "ok",
        new_state: applied_offer.current_state
      }
    else
      status_error
    end

    rescue ::Statesman::TransitionFailedError => e
      status_error
  end
end

#TODO test with rspec
class UsersPresenter < ApplicationPresenter

  def dashboard_main_data
    {
      name: complete_name,
      telephone: source.contact_number,
      email: source.email,
      location: source.city_description
    }
  end

  def applied_offers
    offers = AppliedOffer.where(curriculum_vitae_id: source.curriculum_vitaes.last.id) if source.curriculum_vitaes.any?
    offers.map do |applied|
      { id: applied.id, title: applied.offer_title }
    end if offers.present?
  end

  private

  def complete_name
    "#{source.name} #{source.last_name}"
  end
end

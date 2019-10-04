class LanguagesOffers < ApplicationRecord
  belongs_to :level
  belongs_to :offer
  belongs_to :language

  delegate :description, to: :level, prefix: :level, allow_nil: true
  delegate :description, to: :language, prefix: :language, allow_nil: true

  def offer_show_details
    "#{self.language_description} #{self.level_description}"
  end
end

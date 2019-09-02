class LanguagesOffers < ApplicationRecord
  belongs_to :level
  belongs_to :offer
  belongs_to :language
end

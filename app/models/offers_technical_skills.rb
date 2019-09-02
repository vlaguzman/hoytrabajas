class OffersTechnicalSkills < ApplicationRecord
  belongs_to :offer
  belongs_to :technical_skill
  belongs_to :level
end
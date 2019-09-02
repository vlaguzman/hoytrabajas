class OffersWorkingDays < ApplicationRecord
  belongs_to :offer
  belongs_to :working_day
end

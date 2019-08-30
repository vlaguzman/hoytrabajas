class AvailableWorkDaysOffers < ApplicationRecord
  belongs_to :available_work_day
  belongs_to :offer
end
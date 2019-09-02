class OffersVehicles < ApplicationRecord
  belongs_to :offer
  belongs_to :vehicle
end

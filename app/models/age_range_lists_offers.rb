class AgeRangeListsOffers < ApplicationRecord
  belongs_to :offer
  belongs_to :age_range_list
end
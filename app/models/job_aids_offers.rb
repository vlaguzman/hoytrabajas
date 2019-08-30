class JobAidsOffers < ApplicationRecord
  belongs_to :offer
  belongs_to :job_aid
end
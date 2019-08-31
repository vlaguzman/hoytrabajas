class RequiredExperience < ApplicationRecord
  validates_presence_of :duration

  belongs_to :offer
  belongs_to :duration_type
end
class OffersSalaries < ApplicationRecord
  validates_presence_of  :from

  belongs_to :offer
  belongs_to :salary_period
  belongs_to :salary_type
  belongs_to :currency

  #delegates
  delegate :description, to: :salary_period, prefix: :period, allow_nil: true
  delegate :description, to: :currency, prefix: :currency, allow_nil: true
end

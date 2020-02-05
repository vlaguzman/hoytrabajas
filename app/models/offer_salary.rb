class OfferSalary < ApplicationRecord
  validates_presence_of :from

  belongs_to :offer
  belongs_to :salary_period
  belongs_to :currency

  #delegates
  delegate :description, :id, to: :salary_period, prefix: :period, allow_nil: true
  delegate :description, :id, to: :currency, prefix: :currency, allow_nil: true

  validates_numericality_of :from, :greater_than_or_equal_to => 1, allow_nil: true
  validates_numericality_of :to,   :greater_than_or_equal_to => 1, allow_nil: true
end

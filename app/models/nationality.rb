class Nationality < ApplicationRecord

  validates_presence_of :description

  belongs_to :country
  has_and_belongs_to_many :users
end

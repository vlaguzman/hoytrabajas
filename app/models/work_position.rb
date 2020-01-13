class WorkPosition < ApplicationRecord
  validates_presence_of :description

  validates :description, uniqueness: { case_sensitive: false }

  has_and_belongs_to_many :offers
end
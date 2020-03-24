class JobCategory < ApplicationRecord
  validates_presence_of :description

  scope :by_unaccent_description, -> (description) { where('unaccent(description) ILIKE unaccent(?)', "%#{description}%") }

  has_and_belongs_to_many :curriculum_vitaes
  has_and_belongs_to_many :offers, optional: true
  has_and_belongs_to_many :jc_images, optional: true
end

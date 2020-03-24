class JcImage < ApplicationRecord
  validates :description, presence: true, allow_nil: true

  has_and_belongs_to_many :job_categories
end

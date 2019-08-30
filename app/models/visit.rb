class Visit < ApplicationRecord
  belongs_to :curriculum_vitae, counter_cache: true
end
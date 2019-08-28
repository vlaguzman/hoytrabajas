class Profile < ApplicationRecord
  validates_presence_of :description

  belong_to :user
end

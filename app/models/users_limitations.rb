class UsersLimitations < ApplicationRecord

  validates_presence_of :user, :limitation

  belongs_to :user
  belongs_to :limitation

end

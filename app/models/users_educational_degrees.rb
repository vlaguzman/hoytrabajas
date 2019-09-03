class UsersEducationalDegrees < ApplicationRecord

  belongs_to :user
  belongs_to :educational_degree

end

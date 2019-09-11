class UsersNationalities < ApplicationRecord

  belongs_to :user
  belongs_to :nationality

end

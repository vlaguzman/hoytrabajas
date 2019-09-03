class Limitation < ApplicationRecord

  validates_presence_of :description, :users

  has_and_belongs_to_many :users
end

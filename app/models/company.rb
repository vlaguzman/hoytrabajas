class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates_presence_of :email, :password

  belongs_to :employees_range, optional: true

  has_and_belongs_to_many :users

  has_one_attached :logo
end

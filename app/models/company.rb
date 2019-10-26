class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :confirmable,
          :lockable, :timeoutable, :trackable

  validates_presence_of :email

  belongs_to :employees_range, optional: true
  belongs_to :city, optional: true

  has_and_belongs_to_many :users

  has_one_attached :logo

  delegate :description, to: :employees_range, prefix: :employees_range

end

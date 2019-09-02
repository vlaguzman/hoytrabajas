class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates_presence_of :name, :contact_name, :cellphone, :contact_cellphone, :nit, :address,
                        :email, :web_site, :contact_web_site, :description, :contact_work_position

  belongs_to :employees_range

  has_one_attached :logo
end

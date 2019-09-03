class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :confirmable,
          :lockable, :timeoutable, :trackable, :omniauthable, omniauth_providers:%i[facebook]

  validates_presence_of :name, :last_name,
                        :identification_number, :about_me,
                        :birthday, :educational_degrees,
                        :educational_degrees, :confirmed_at,
                        :sign_in_count, :password_confirmation, :contact_number

  belongs_to :sex
  belongs_to :contract_type
  belongs_to :document_type
  belongs_to :work_mode


  has_and_belongs_to_many :nationalities
  has_and_belongs_to_many :limitations
  has_and_belongs_to_many :educational_degrees
  has_and_belongs_to_many :curriculum_vitaes

  has_and_belongs_to_many :companies
end

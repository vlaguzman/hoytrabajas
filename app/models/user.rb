class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :confirmable,
          :lockable, :timeoutable, :trackable, :omniauthable, omniauth_providers:%i[facebook]

  validates_presence_of :email, :confirmed_at, :sign_in_count

  belongs_to :sex,                optional: true
  belongs_to :contract_type,      optional: true
  belongs_to :document_type,      optional: true
  belongs_to :work_mode,          optional: true
  belongs_to :educational_degree, optional: true
  belongs_to :city,               optional: true


  has_many :curriculum_vitaes

  has_and_belongs_to_many :nationalities
  has_and_belongs_to_many :limitations
  has_and_belongs_to_many :companies
  has_and_belongs_to_many :vehicles
  has_and_belongs_to_many :driving_licences

  accepts_nested_attributes_for :curriculum_vitaes
end

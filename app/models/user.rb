class User < ApplicationRecord

  validates :name, :last_name, :identification_number, :contact_number,
            :document_type_id, presence: true, allow_nil: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :confirmable,
          :lockable, :timeoutable, :trackable, :omniauthable, omniauth_providers:%i[facebook]

  validates_presence_of :email, :sign_in_count

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

  delegate :description, to: :city, prefix: :city, allow_nil: true
  delegate :state_id, to: :city, prefix: :city, allow_nil: true

  accepts_nested_attributes_for :curriculum_vitaes

  has_one_attached :cv_file

  def curriculum_vitae
    curriculum_vitaes.any? ? curriculum_vitaes.first : CurriculumVitae.create(user_id: self.id)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

  def attributes_to_compare
    [:contract_type_id, :educational_degree_id]   
  end

  def lists_to_compare
    [:vehicles, :driving_licences]
  end

  def after_confirmation
    self.update_attribute(:confirmed_at, DateTime.now)
  end

  def born_city
    City.find_by(id: self.born_city_id)
  end

  def residence_city
    City.find_by(id: self.residence_city_id)
  end

end

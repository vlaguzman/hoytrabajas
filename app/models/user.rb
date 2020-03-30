class User < ApplicationRecord

  #TODO Oscar disable while sidekiq is in optimization
  #after_commit on: :update do
  #  AffinityPercentages::ExecuteUpdateWorker.perform_async(self.curriculum_vitae.id)
  #end

  ATTRIBUTES_TO_COMPARE = [:contract_type_id, :educational_degree_id, :sex_id]
  LISTS_TO_COMPARE = [:vehicles, :driving_licences]

  validates :name, :last_name, :born_city_id, :residence_city_id, :identification_number, :contact_number,
            :document_type_id, :about_me, :educational_degree_id, presence: true, allow_nil: true

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
  delegate :state_country_id, to: :city, prefix: :city, allow_nil: true
  delegate :state_id, to: :city, prefix: :city, allow_nil: true
  delegate :description, to: :sex, prefix: :sex, allow_nil: true
  delegate :description, to: :document_type, prefix: :document_type, allow_nil: true
  delegate :description, to: :educational_degree, prefix: :educational_degree, allow_nil: true

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

  def after_confirmation
    self.update_attribute(:confirmed_at, DateTime.now)
  end

  def born_city
    City.find_by(id: self.born_city_id)
  end

  def born_state
    born_city.state if born_city.present?
  end

  def born_country
    born_state.country if born_state.present? && born_city.present?
  end

  def residence_city
    City.find_by(id: self.residence_city_id)
  end

  def residence_state
    residence_city.state if residence_city.present?
  end

  def residence_country
    residence_state.country if residence_state.present? && residence_city.present?
  end

end

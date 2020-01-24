class WorkExperience < ApplicationRecord

  validates_presence_of :job_category, :work_position

  belongs_to :job_category
  belongs_to :work_methodology, optional: true
  belongs_to :contract_type, optional: true
  belongs_to :curriculum_vitae
  belongs_to :work_position
  belongs_to :city, optional: true

  has_and_belongs_to_many :technical_skills

  delegate :description, to: :work_position, prefix: :work_position, allow_nil: true
  delegate :description, to: :job_category, prefix: :job_category, allow_nil: true
  delegate :state_id, to: :city, prefix: :city, allow_nil: true
  delegate :state_country_id, to: :city, prefix: :city, allow_nil: true

  def self.user_wizard_step_eight_list(curriculum_id)
    where(curriculum_vitae_id: curriculum_id).map { |exp| [exp.company_name, exp.work_position.description] }
  end

  def total_time
    DatesManager.calculate_difference_time(finished_at, started_at)
  end
end

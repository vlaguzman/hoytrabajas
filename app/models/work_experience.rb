class WorkExperience < ApplicationRecord

  validates_presence_of :job_category, :work_position

  belongs_to :job_category
  belongs_to :work_methodology, optional: true
  belongs_to :contract_type, optional: true
  belongs_to :curriculum_vitae
  belongs_to :work_position
  belongs_to :city, optional: true

  has_and_belongs_to_many :technical_skills

  def self.user_wizard_step_eight_list(curriculum_id)
    where(curriculum_vitae_id: curriculum_id).map { |exp| [exp.company_name, exp.work_position.description] }
  end

  def total_time
    DatesManager.calculate_difference_time(finished_at, started_at)
  end
end

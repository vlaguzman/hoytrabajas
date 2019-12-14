class Users::Wizards::StepEights::WorkExperiencePresenter < ApplicationPresenter

  def range_of_time
    super(started_at, finished_at, still_in_progress, t('date.today') )
  end

  def responsabilities
    source.technical_skills.map{ |technical_skill| technical_skill.description }
  end

  def return_path
    rails_routes.users_wizards_step_eight_path
  end

  def next_path
    rails_routes.users_wizards_step_nine_path
  end

end
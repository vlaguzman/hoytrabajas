class Users::Wizards::StepEights::WorkExperiencePresenter < ApplicationPresenter

  def range_of_time
    start = "#{ t('date.month_names')[started_at.month]} #{started_at.year}"
    finish = "#{ t('date.month_names')[finished_at.month] } #{finished_at.year}" if finished_at.present?

    difference = DatesManager.calculate_difference_time(finished_at.present? ? finished_at : Date.today, started_at)

    not_in_progress = "#{finish} - #{difference}"

    "#{start} - #{ (still_in_progress) ? t('date.today') : not_in_progress }"
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
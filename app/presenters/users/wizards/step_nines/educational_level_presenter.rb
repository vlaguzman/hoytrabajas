class Users::Wizards::StepNines::EducationalLevelPresenter < ApplicationPresenter

  def range_of_time
    start = "#{ t('date.month_names')[start_date.month]} #{start_date.year}"
    finish = "#{ t('date.month_names')[finish_date.month] } #{finish_date.year}" if finish_date.present?

    difference = DatesManager.calculate_difference_time(finish_date.present? ? finish_date : Date.today, start_date)

    not_in_progress = "#{finish} - #{difference}"

    "#{start} - #{ (ongoing_study) ? t('users.wizards.step_nines.added_educational_levels.show.ongoing_study') : not_in_progress }"
  end

  def location
    "#{city.description}, #{city.state_description}" if city.present?
  end

  def return_path
    rails_routes.users_wizards_step_nine_path
  end

  def next_path
    rails_routes.users_wizards_step_ten_path
  end

end
class Users::Wizards::StepNines::EducationalLevelPresenter < ApplicationPresenter

  def range_of_time
    super(start_date, finish_date, ongoing_study, t('users.wizards.step_nines.added_educational_levels.show.ongoing_study') )
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
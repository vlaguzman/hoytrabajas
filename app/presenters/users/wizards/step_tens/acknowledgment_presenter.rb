class Users::Wizards::StepTens::AcknowledgmentPresenter < ApplicationPresenter

  def award_date
    "#{ t('date.month_names')[start_date.month]} #{start_date.year}"
  end

  def location
    "#{city.description}, #{city.state_description}" if city.present?
  end

  def return_path
    rails_routes.users_wizards_step_ten_path
  end

  def next_path
    rails_routes.users_wizards_step_eleven_path
  end

end
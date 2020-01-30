class Users::Wizards::StepSevenPresenter < ApplicationPresenter
  def return_path
    rails_routes.users_wizards_step_six_path
  end

  def next_path
    rails_routes.users_wizards_step_eight_path
  end

  def skip_path
    rails_routes.users_wizards_step_nines_choices_path
  end
end
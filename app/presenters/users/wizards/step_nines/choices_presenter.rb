class Users::Wizards::StepNines::ChoicesPresenter < ApplicationPresenter
  def return_path
    rails_routes.users_wizards_step_eight_path
  end

  def current_path
    rails_routes.users_wizards_step_nine_path
  end

  def skip_path
    rails_routes.users_wizards_step_ten_path
  end
end
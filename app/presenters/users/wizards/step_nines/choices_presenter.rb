class Users::Wizards::StepNines::ChoicesPresenter < ApplicationPresenter
  def return_path
    has_work_experience? ? rails_routes.users_wizards_step_eight_path : rails_routes.users_wizards_step_seven_path
  end

  def current_path
    rails_routes.users_wizards_step_nine_path
  end

  def skip_path
    validation_skip_path
  end

  def has_work_experience?
    WorkExperience.exists?(curriculum_vitae_id: source.curriculum_vitae.id)
  end

  private

  def validation_skip_path
    if options[:cookies].present?
      Offers::AppliedOfferService.(user: source, params_offer: { offer_id: options[:cookies].split('/')[2].to_i } )
      options[:cookies]
    else
      rails_routes.users_wizards_step_eleven_path
    end
  end
end

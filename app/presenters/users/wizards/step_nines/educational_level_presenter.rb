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
    validation_next_path
  end

  private

  def validation_next_path
    if options[:cookies].present?
      Offers::AppliedOfferService.(user: options[:user], params_offer: { offer_id: options[:cookies].split('/')[2].to_i } )
      options[:cookies]
    else
      rails_routes.users_wizards_step_eleven_path
    end
  end

end

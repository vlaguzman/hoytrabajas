class Companies::ProfilesPresenter < ApplicationPresenter

  DEFAULT_IMAGE_LOGO_URL = ENV['DEFAULT_IMAGE_LOGO_URL']

  def basic_data
    {
      name: get_value_of_record(source).validate_present?(:simple, :name)
    }
  end

  def give_the_profile_picture
    if source.logo.attached?
      rails_routes.rails_blob_path(source.logo, disposition: 'attachment', only_path: true )
    else
      DEFAULT_IMAGE_LOGO_URL
    end
  end

  private

  def get_value_of_record(record)
    GetValueOfRecord.new(record)
  end

end

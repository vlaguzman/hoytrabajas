class ApplicationPresenter < SimpleDelegator
  include ActionView::Helpers

  attr_reader :source, :options

  def initialize(source, **options)
    @source = source
    @options = options
    super(source)
  end

  def model_list(model)
    model.all.map { |object| [object.description, object.id] }
  end

  def range_of_time(start_date, finish_date, in_progress, in_progress_translation)
    start = "#{ t('date.month_names')[start_date.month]} #{start_date.year}"
    finish = "#{ t('date.month_names')[finish_date.month] } #{finish_date.year}" if finish_date.present?

    difference = DatesManager.calculate_difference_time(finish_date.present? ? finish_date : Date.today, start_date)

    not_in_progress = "#{finish} - #{difference}"

    "#{start} - #{ (in_progress) ? in_progress_translation : not_in_progress }"
  end

  def rails_routes
    Rails.application.routes.url_helpers
  end

  def yield_if(condition)
    yield if condition
  end

  def validate_cookie_path(object, cookies, path)
    if options[:cookies].present?
      Offers::AppliedOfferService.(user: object, params_offer: { offer_id: cookies.split('/')[2].to_i } )
      cookies
    else
      path
    end
  end

end

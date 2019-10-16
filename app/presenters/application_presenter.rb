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

  def rails_routes
    Rails.application.routes.url_helpers
  end
end
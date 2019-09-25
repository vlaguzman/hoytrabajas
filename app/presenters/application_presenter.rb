class ApplicationPresenter < SimpleDelegator
  include ActionView::Helpers

  attr_reader :source, :options

  def initialize(source, **options)
    @source = source
    @options = options
    super(source)
  end

  def assets
    ActionController::Base.helpers
  end

  def model_list(model)
    model.all.map { |object| [object.description, object.id] }
  end
end
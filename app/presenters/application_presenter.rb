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
end
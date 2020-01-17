class Companies::FirstOfferPresenter < ApplicationPresenter

  private

  def service_params(**params)
    {
      source: source,
      errors: source.errors,
      form_method: :put,
      form_type: :offer
    }.merge(params)
  end
end

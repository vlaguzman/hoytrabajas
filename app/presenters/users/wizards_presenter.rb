class Users::WizardsPresenter < ApplicationPresenter

  private

  def service_params(**params)
    {
      source: source,
      errors: source.errors,
      form_method: :put
    }.merge(params)
  end

end
class Users::WizardsPresenter < ApplicationPresenter

  private

  def service_params(**params)
    {
      errors: source.errors,
      form_method: :put
    }.merge(params)
  end

end
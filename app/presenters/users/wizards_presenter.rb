class Users::WizardsPresenter < ApplicationPresenter

  private

  def service_params(**params)
    {
      source: source,
      errors: source.errors,
      form_method: :post,
      form_type: :user
    }.merge(params)
  end

end
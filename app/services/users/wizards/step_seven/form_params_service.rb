class Users::Wizards::StepSeven::FormParamsService < BaseFormWizardsService

  private

  def buttons_translation
    template_translations[:form][:buttons]
      .merge(previousPath: previous_path)
      .merge(skipPath: skip_path)
      .merge(nextPath: next_path) if template_translations.present?
  end

end
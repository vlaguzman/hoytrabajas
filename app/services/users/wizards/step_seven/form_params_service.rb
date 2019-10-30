class Users::Wizards::StepSeven::FormParamsService < BaseFormWizardsService

  private

  def buttons_translation
    buttons = template_translations[:form][:buttons]
      .merge(previousPath: previous_path)
      .merge(nextPath: next_path)
      .merge(skipPath: skip_path)
      .tap { |object| object.merge!(haveExperience: object.delete(:have_experience) ) } if template_translations.present?
  end

end
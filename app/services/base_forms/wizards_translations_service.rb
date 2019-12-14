module BaseForms::WizardsTranslationsService

  def labels
    template_translations[:form][:formFields]
  end

  def template_translations
    I18n.t(template_translation_path).deep_symbolize_keys
  end

  def placeholders_translations
    object = template_translations[:form][:placeholders]
    object.present? ? {}.merge(object) : {}
  end

  def buttons_translation
    buttons = template_translations[:form][:buttons]
      .merge(previousPath: previous_path)
      .merge(nextPath: next_path)
      .tap { |object| object.merge!(addOther: object.delete(:add_other) ) } if template_translations.present?
  end
end
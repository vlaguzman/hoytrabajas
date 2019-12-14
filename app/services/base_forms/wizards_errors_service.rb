module BaseForms::WizardsErrorsService

  def errors_messages
    errors.present? ? {errors: errors.messages.map{|_, error_messages| error_messages}} : {}
  end

end
class WizardsLastStepService < BaseFormWizardsService

  def initialize(**params)
    self.source                     = params[:source]
    self.errors                     = params[:errors]
    self.form_type                  = params[:form_type] || :user
    self.template_translation_path  = params[:template_translation_path]
    self.go_home_path               = params[:go_home_path]
    self.next_path                  = params[:next_path]
    self.form_method                = params[:form_method] || :get
  end

  private

  attr_accessor :source, :go_home_path, :continue_path

  def buttons_translation
    buttons = template_translations[:form][:buttons]
      .tap do |object|
        object.merge!(goHomePath: go_home_path)
        object.merge!(goHome: object.delete(:go_home))
        object.merge!(nextPath: next_path)

      end if template_translations.present?
  end
end
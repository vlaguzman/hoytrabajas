class Users::Wizards::StepEleven::FormParamsService < BaseFormWizardsService

  attr_accessor :user, :go_home_path, :continue_path

  def initialize(
    users: nil,
    errors: nil,
    form_type: :user,
    template_translation_path: nil,
    go_home_path: nil,
    next_path: nil,
    form_method: :get)


    @users                     = users
    @errors                    = errors
    @form_type                 = form_type
    @template_translation_path = template_translation_path
    @go_home_path              = go_home_path
    @next_path                 = next_path
    @form_method               = form_method
  end

  private

  def buttons_translation

    buttons = template_translations[:form][:buttons]
      .tap do |object|
        object.merge!(goHomePath: go_home_path)
        object.merge!(goHome: object.delete(:go_home))
        object.merge!(nextPath: next_path)

      end if template_translations.present?
  end


end
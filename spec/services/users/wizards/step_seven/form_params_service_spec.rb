require 'rails_helper'

RSpec.describe Users::Wizards::StepSeven::FormParamsService do

  describe "#form_params" do

    let(:subject) { described_class }

    it "should return the expected object" do

      expected_object = {
        title: 'Cuentanos un poco de tu experiencia',
        subtitle: 'Brinda a las empresas información valiosa sobre ti.',
        form: {
          buttons: {
            submit: 'Siguiente',
            next: 'Saltar',
            previous: 'Regresar',
            previousPath: '/users/wizards/step_six',
            nextPath: '/users/wizards/step_eight',
            skipPath: '/users/wizards/step_nine',
            have_experience: 'Cuentas con experiencía',
            acceptButton: 'Si, quiero adicionarla',
            skipButton: 'Selecciona el idioma'
          },
          action: '/users/wizards/step_seven',
          method: :post,
          type: :user,
          formFields: {},
          placeholders:{}
        }
      }

      response = subject.new(
        skip_path: '/users/wizards/step_nine',
        template_translation_path: 'users.wizards.step_sevens.show',
        action_path: '/users/wizards/step_seven',
        previous_path: '/users/wizards/step_six',
        next_path: '/users/wizards/step_eight'
      ).form_params

      expect(response[:form][:buttons]).to eq(expected_object[:form][:buttons])
      expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

      expect(response.keys).to match_array(expected_object.keys)
      expect(response).to eq(expected_object)
    end
  end

end
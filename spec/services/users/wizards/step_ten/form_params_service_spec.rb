require 'rails_helper'

RSpec.describe Users::Wizards::StepTen::FormParamsService do

  describe "#form_params" do

    let(:subject) { described_class }

    it "should return the expected object" do

      expected_object = {
        title: '¿Cuentas con reconocimientos?',
        subtitle: 'Brinda a las empresas información valiosa sobre ti.',
        form: {
          buttons: {
            addOther: 'Agregar otro reconocimiento',
            submit: 'Guardar y Publicar',
            next: 'Saltar',
            previous: 'Regresar',
            previousPath: '/users/wizards/step_nine',
            nextPath: '/users/wizards/step_eleven',
          },
          action: '/users/wizards/step_ten',
          method: :put,
          type: :user,
          formFields: {
            title: {
              name: 'user[curriculum_vitae][acknowledgment][title]',
              label: 'Título reconocimiento',
              current_value: ''
            },
            start_date: {
              name: 'user[curriculum_vitae][acknowledgment][start_date]',
              label: 'Fecha de inicio',
              current_value: ''
            },
            entity_name: {
              name: 'user[curriculum_vitae][acknowledgment][entity_name]',
              label: 'Institución o entidad',
              current_value: ''
            },
            diploma: {
              name: 'user[curriculum_vitae][acknowledgment][diploma]',
              label: 'Carga aquí tu diploma',
              current_value: ''
            }
          },
          placeholders:{}
        }
      }

      response = subject.new(
        template_translation_path: 'users.wizards.step_tens.show',
        action_path: '/users/wizards/step_ten',
        previous_path: '/users/wizards/step_nine',
        next_path: '/users/wizards/step_eleven',
        form_method: :put
      ).form_params

      expect(response[:form][:buttons]).to eq(expected_object[:form][:buttons])
      expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

      expect(response.keys).to match_array(expected_object.keys)
      expect(response).to eq(expected_object)
    end
  end

end

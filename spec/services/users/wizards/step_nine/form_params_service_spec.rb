require 'rails_helper'

RSpec.describe Users::Wizards::StepNine::FormParamsService do

  describe "#form_params" do

    let!(:cities) { create_list(:city, 5) }
    let(:create_cites_list) { ListConverter.model_list(City) }

    let(:subject) { described_class }

    it "should return the expected object" do

      expected_object = {
        title: 'Veamos tu formación académica',
        subtitle: 'Brinda a las empresas información valiosa sobre ti.',
        form: {
          buttons: {
            addOther: 'Agregar otro estudio',
            submit: 'Siguiente',
            next: 'Saltar',
            previous: 'Regresar',
            previousPath: '/users/wizards/step_eight',
            nextPath: '/users/wizards/step_ten',
          },
          action: '/users/wizards/step_nine',
          method: :put,
          type: :user,
          formFields: {
            degree: {
              label: 'Título educativo*',
              name: 'user[curriculum_vitae][educational_level][degree]'
            },
            institution_name: {
              label: 'Institución',
              name: 'user[curriculum_vitae][educational_level][institution_name]'
            },
            start_date: {
              label: 'Fecha de inicio',
              name: 'user[curriculum_vitae][educational_level][start_date]'
            },
            finish_date: {
              label: '',
              name: 'user[curriculum_vitae][educational_level][finish_date]'
            },
            ongoing_study: {
              label: 'Estudio en curso',
              name: 'user[curriculum_vitae][educational_level][ongoing_study]'
            },
            city_id: {
              label: 'Ubicación',
              name: 'user[curriculum_vitae][educational_level][city_id]',
              values: create_cites_list
            },
            diploma: {
              label: 'Carga aquí tu diploma',
              name: 'user[curriculum_vitae][educational_level][diploma]'
            },
          },
          placeholders:{
            finish_date: 'Terminacíon'
          }
        }
      }

      response = subject.new(
        template_translation_path: 'users.wizards.step_nines.show',
        action_path: '/users/wizards/step_nine',
        previous_path: '/users/wizards/step_eight',
        next_path: '/users/wizards/step_ten',
        form_method: :put
      ).form_params

      expect(response[:form][:buttons]).to eq(expected_object[:form][:buttons])
      expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

      expect(response.keys).to match_array(expected_object.keys)
      expect(response).to eq(expected_object)
    end
  end

end
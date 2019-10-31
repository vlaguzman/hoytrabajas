require 'rails_helper'

RSpec.describe Users::Wizards::StepFour::FormParamsService do

  describe "#form_params" do
    let!(:cities) { create_list(:city, 5) }
    let(:create_cities_list) { ListConverter.model_list(City) }

    let!(:states) { create_list(:state, 5) }
    let(:create_states_list) { ListConverter.model_list(State) }

    let!(:driving_licences) { create_list(:driving_licence, 5) }
    let(:create_driving_licences_list) { ListConverter.model_list(DrivingLicence) }

    let!(:vehicles) { create_list(:vehicle, 5) }
    let(:create_vehicles_list) { ListConverter.model_list(Vehicle) }

    let(:subject) { described_class }

    it "should return the expected object" do

      expected_object = {
        title: '¡Búsquemos las mejores ofertas!',
        subtitle: 'Brinda a las empresas información valiosa sobre ti.',
        form: {
          buttons: {
            submit: 'Siguiente',
            next: 'Saltar',
            previous: 'Regresar',
            nextPath: '/users/wizards/step_five',
            previousPath: '/users/wizards/step_three'
          },
          action: '/users/wizards/step_four',
          method: :put,
          type: :user,
          formFields: {
            city_id: {
              name: 'user[city_id]',
              label: 'Ciudad',
              values: create_cities_list
            },
            state_id: {
              name: 'user[state_id]',
              label: 'Departamento',
              values: create_states_list
            },
            driving_licence_ids: {
              name: 'user[driving_licence_ids][]',
              label: 'Licencia de conducción requerida',
              values: create_driving_licences_list
            },
            vehicle_ids: {
              name: 'user[vehicle_ids][]',
              label: 'Cuentas con algún tipo de vehículo',
              values: create_vehicles_list
            },
            travel_disponibility: {
              name: 'user[curriculum_vitae][travel_disponibility]',
              label: 'Disponibilidad para trabajar en otra ciudades'
            }
          },
          placeholders: {}
        }
      }

      response = subject.new(
        form_type: :user,
        template_translation_path: "users.wizards.step_fours.show",
        action_path: "/users/wizards/step_four" ,
        previous_path: "/users/wizards/step_three",
        next_path: "/users/wizards/step_five",
        form_method: :put
      ).form_params

      expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

      expect(response.keys).to match_array(expected_object.keys)
      expect(response).to eq(expected_object)
    end
  end

end
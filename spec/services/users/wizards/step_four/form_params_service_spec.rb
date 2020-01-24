require 'rails_helper'

RSpec.describe Users::Wizards::StepFour::FormParamsService do

  describe "#form_params" do
    let!(:cities) { create_list(:city, 5) }
    let(:create_cities_list) { ListConverter.model_list(City) }

    let(:create_states_list) { ListConverter.model_list(State, nil, additional_key: :country_id) }

    let(:create_countries_list) { ListConverter.model_list(Country) }

    let!(:driving_licences) { create_list(:driving_licence, 5) }
    let(:create_driving_licences_list) { ListConverter.model_list(DrivingLicence) }

    let!(:vehicles) { create_list(:vehicle, 5) }
    let(:create_vehicles_list) { ListConverter.model_list(Vehicle) }

    let(:subject) { described_class }

    context "When user does not have data" do
      let(:user) { create(:user, :first_time_candidate) }

      it "should return the expected object" do

        expected_object = {
          title: '¡Búsquemos las mejores ofertas!',
          subtitle: 'Brinda a las empresas información valiosa sobre ti.',
          form: {
            buttons: {
              addOther: nil,
              submit: 'Siguiente',
              next: 'Saltar',
              previous: 'Regresar',
              nextPath: '/users/wizards/step_five',
              previousPath: '/users/wizards/step_three'
            },
            action: '/users/wizards/step_four',
            method: :post,
            type: :user,
            formFields: {
              city_id: {
                name: 'user[city_id]',
                label: 'Ciudad de interes para trabajar',
                values: create_cities_list,
                current_value: nil
              },
              state_id: {
                name: 'user[state_id]',
                label: 'Departamento de interes para trabajar',
                values: create_states_list,
                current_value: nil
              },
              country_id: {
                name: 'user[country_id]',
                label: 'Pais de interes para trabajar',
                values: create_countries_list,
                current_value: nil
              },
              driving_licence_ids: {
                name: 'user[driving_licence_ids][]',
                label: 'Licencia de conducción requerida',
                values: create_driving_licences_list,
                current_value: []
              },
              vehicle_ids: {
                name: 'user[vehicle_ids][]',
                label: 'Cuentas con algún tipo de vehículo',
                values: create_vehicles_list,
                current_value: []
              },
              travel_disponibility: {
                name: 'user[curriculum_vitae][travel_disponibility]',
                label: 'Disponibilidad para trabajar en otra ciudades',
                current_value: nil
              }
            },
            placeholders: {}
          }
        }

        response = subject.new(
          source: user,
          errors: user.errors,
          form_type: :user,
          template_translation_path: "users.wizards.step_fours.show",
          action_path: "/users/wizards/step_four" ,
          previous_path: "/users/wizards/step_three",
          next_path: "/users/wizards/step_five",
          form_method: :post
        ).form_params

        expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

        expect(response.keys).to match_array(expected_object.keys)
        expect(response).to eq(expected_object)
      end
    end

    context "When user have data" do

      let(:expected_driving_licences) { [driving_licences[0], driving_licences[1]] }
      let(:expected_vehicles) { [vehicles[0], vehicles[1]] }

      let!(:cv) { create(:curriculum_vitae, :empty,
        city: nil,
        travel_disponibility: true,
        user: create(:user,
          city: cities.last,
          driving_licences: expected_driving_licences,
          vehicles: expected_vehicles
        )
      ) }

      let(:user_with_data) { cv.user }

      it "should return the expected object" do

        expected_object = {
          title: '¡Búsquemos las mejores ofertas!',
          subtitle: 'Brinda a las empresas información valiosa sobre ti.',
          form: {
            buttons: {
              addOther: nil,
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
                label: 'Ciudad de interes para trabajar',
                values: create_cities_list,
                current_value: cities.last.id
              },
              state_id: {
                name: 'user[state_id]',
                label: 'Departamento de interes para trabajar',
                values: create_states_list,
                current_value: cities.last.state_id
              },
              country_id: {
                name: 'user[country_id]',
                label: 'Pais de interes para trabajar',
                values: create_countries_list,
                current_value: cities.last.state_country_id
              },
              driving_licence_ids: {
                name: 'user[driving_licence_ids][]',
                label: 'Licencia de conducción requerida',
                values: create_driving_licences_list,
                current_value: expected_driving_licences.pluck(:id)
              },
              vehicle_ids: {
                name: 'user[vehicle_ids][]',
                label: 'Cuentas con algún tipo de vehículo',
                values: create_vehicles_list,
                current_value: expected_vehicles.pluck(:id)
              },
              travel_disponibility: {
                name: 'user[curriculum_vitae][travel_disponibility]',
                label: 'Disponibilidad para trabajar en otra ciudades',
                current_value: true
              }
            },
            placeholders: {}
          }
        }

        response = subject.new(
          source: user_with_data,
          errors: user_with_data.errors,
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

end

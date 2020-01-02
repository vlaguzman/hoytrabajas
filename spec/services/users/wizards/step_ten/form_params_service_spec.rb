require 'rails_helper'

RSpec.describe Users::Wizards::StepTen::FormParamsService do

  describe '#form_params' do
    let!(:cities) { create_list(:city, 5) }
    let(:create_cites_list) { ListConverter.model_list(City) }
    let(:create_states_list) { ListConverter.model_list(State) }

    let(:subject) { described_class }

    context 'When the acknowledgment is new' do
      let(:new_acknowledgment) { build(:acknowledgment, :empty) }

      it 'should return the expected object' do

        expected_object = {
          title: '¿Cuentas con reconocimientos?',
          subtitle: 'Brinda a las empresas información valiosa sobre ti.',
          form: {
            buttons: {
              addOther: 'Agregar otro reconocimiento',
              submit: 'Continuar',
              next: 'Saltar',
              previous: 'Regresar',
              previousPath: '/users/wizards/step_nine',
              nextPath: '/users/wizards/step_eleven',
            },
            action: '/users/wizards/step_ten',
            method: :post,
            type: :acknowledgment,
            formFields: {
              title: {
                name: 'acknowledgment[title]',
                label: 'Título reconocimiento*',
                current_value: nil
              },
              start_date: {
                name: 'acknowledgment[start_date]',
                label: 'Fecha de inicio',
                current_value: nil
              },
              entity_name: {
                name: 'acknowledgment[entity_name]',
                label: 'Institución o entidad',
                current_value: nil
              },
              diploma: {
                name: 'acknowledgment[diploma]',
                label: 'Carga aquí tu diploma',
                current_value: new_acknowledgment.diploma
              },
              city_id: {
                name: 'acknowledgment[city_id]',
                label: 'Ciudad',
                values: create_cites_list,
                current_value: nil
              },
              state_id: {
                name: 'acknowledgment[state_id]',
                label: 'Departamento',
                values: create_states_list,
                current_value: nil
              }
            },
            placeholders:{}
          }
        }

        response = subject.new(
          source: new_acknowledgment,
          form_type: :acknowledgment,
          template_translation_path: 'users.wizards.step_tens.show',
          action_path: '/users/wizards/step_ten',
          previous_path: '/users/wizards/step_nine',
          next_path: '/users/wizards/step_eleven'
        ).form_params

        expect(response[:form][:buttons]).to eq(expected_object[:form][:buttons])
        expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

        expect(response.keys).to match_array(expected_object.keys)
        expect(response).to eq(expected_object)
      end
    end

    context 'When the acknowledgment was update' do
      let(:expected_acknowledgment) { build(:acknowledgment,
        title: 'Food manager of the year',
        start_date: DateTime.new(2000, 12, 30),
        entity_name: 'Food cooker master center',
        city: cities.last
      ) }

      it "should return expected object" do
        expected_object = {
          title: '¿Cuentas con reconocimientos?',
          subtitle: 'Brinda a las empresas información valiosa sobre ti.',
          form: {
            buttons: {
              addOther: 'Agregar otro reconocimiento',
              submit: 'Continuar',
              next: 'Saltar',
              previous: 'Regresar',
              previousPath: '/users/wizards/step_nine',
              nextPath: '/users/wizards/step_eleven',
            },
            action: '/users/wizards/step_ten',
            method: :post,
            type: :acknowledgment,
            formFields: {
              title: {
                name: 'acknowledgment[title]',
                label: 'Título reconocimiento*',
                current_value: 'Food manager of the year'
              },
              start_date: {
                name: 'acknowledgment[start_date]',
                label: 'Fecha de inicio',
                current_value: DateTime.new(2000, 12, 30)
              },
              entity_name: {
                name: 'acknowledgment[entity_name]',
                label: 'Institución o entidad',
                current_value: 'Food cooker master center'
              },
              diploma: {
                name: 'acknowledgment[diploma]',
                label: 'Carga aquí tu diploma',
                current_value: expected_acknowledgment.diploma
              },
              city_id: {
                name: 'acknowledgment[city_id]',
                label: 'Ciudad',
                values: create_cites_list,
                current_value: cities.last.id
              },
              state_id: {
                name: 'acknowledgment[state_id]',
                label: 'Departamento',
                values: create_states_list,
                current_value: cities.last.state.id
              }
            },
            placeholders:{}
          }
        }

        response = subject.new(
          source: expected_acknowledgment,
          form_type: :acknowledgment,
          template_translation_path: 'users.wizards.step_tens.show',
          action_path: '/users/wizards/step_ten',
          previous_path: '/users/wizards/step_nine',
          next_path: '/users/wizards/step_eleven'
        ).form_params

        expect(response).to eq(expected_object)
      end

    end

  end

end

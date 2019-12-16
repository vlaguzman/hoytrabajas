require 'rails_helper'

RSpec.describe Users::Wizards::StepNine::FormParamsService do

  describe '#form_params' do

    let!(:cities) { create_list(:city, 5) }
    let(:create_cites_list) { ListConverter.model_list(City) }

    let(:subject) { described_class }

    context 'When user want edit the education level' do
      let(:expected_educational_level) { build(:educational_level,
        degree: 'Irrelevant Topics Engineer',
        institution_name: 'Centrar City University',
        start_date: Date.today,
        finish_date: Date.today + 3.years,
        ongoing_study: 0,
        city: cities.last,

        ) }

      it 'should return the expected object' do

        expected_object = {
          title: 'Veamos tu formación académica',
          subtitle: 'Brinda a las empresas información valiosa sobre ti.',
          form: {
            buttons: {
              addOther: 'Agregar otro estudio',
              submit: 'Continuar',
              next: 'Saltar',
              previous: 'Regresar',
              previousPath: '/users/wizards/step_eight',
              nextPath: '/users/wizards/step_ten',
            },
            action: '/users/wizards/step_nine',
            method: :post,
            type: :educational_level,
            formFields: {
              degree: {
                label: 'Título educativo*',
                name: 'educational_level[degree]',
                current_value: 'Irrelevant Topics Engineer'
              },
              institution_name: {
                label: 'Institución',
                name: 'educational_level[institution_name]',
                current_value: 'Centrar City University'
              },
              start_date: {
                label: 'Fecha de inicio',
                name: 'educational_level[start_date]',
                current_value: Date.today
              },
              finish_date: {
                label: 'Fecha de finalización',
                name: 'educational_level[finish_date]',
                current_value: Date.today + 3.years
              },
              ongoing_study: {
                label: 'Estudio en curso',
                name: 'educational_level[ongoing_study]',
                current_value: false
              },
              city_id: {
                label: 'Ubicación',
                name: 'educational_level[city_id]',
                values: create_cites_list,
                current_value: cities.last.id.to_s
              },
              diploma: {
                label: 'Carga aquí tu diploma',
                name: 'educational_level[diploma]',
                current_value: expected_educational_level.diploma
              },
            },
            placeholders:{
              finish_date: 'Terminación'
            }
          }
        }

        response = subject.new(
          source: expected_educational_level,
          form_type: :educational_level,
          template_translation_path: 'users.wizards.step_nines.show',
          action_path: '/users/wizards/step_nine',
          previous_path: '/users/wizards/step_eight',
          next_path: '/users/wizards/step_ten',
          form_method: :post
        ).form_params

        expect(response[:form][:buttons]).to eq(expected_object[:form][:buttons])
        expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

        expect(response.keys).to match_array(expected_object.keys)
        expect(response).to eq(expected_object)
      end
    end

    context 'When user is new and want add educational level' do
      let(:expected_educational_level) { build(:educational_level, :empty,
        institution_name: nil
        ) }

      it 'should return the expected object' do

        expected_object = {
          title: 'Veamos tu formación académica',
          subtitle: 'Brinda a las empresas información valiosa sobre ti.',
          form: {
            buttons: {
              addOther: 'Agregar otro estudio',
              submit: 'Continuar',
              next: 'Saltar',
              previous: 'Regresar',
              previousPath: '/users/wizards/step_eight',
              nextPath: '/users/wizards/step_ten',
            },
            action: '/users/wizards/step_nine',
            method: :post,
            type: :educational_level,
            formFields: {
              degree: {
                label: 'Título educativo*',
                name: 'educational_level[degree]',
                current_value: nil
              },
              institution_name: {
                label: 'Institución',
                name: 'educational_level[institution_name]',
                current_value: nil
              },
              start_date: {
                label: 'Fecha de inicio',
                name: 'educational_level[start_date]',
                current_value: nil
              },
              finish_date: {
                label: 'Fecha de finalización',
                name: 'educational_level[finish_date]',
                current_value: nil
              },
              ongoing_study: {
                label: 'Estudio en curso',
                name: 'educational_level[ongoing_study]',
                current_value: nil
              },
              city_id: {
                label: 'Ubicación',
                name: 'educational_level[city_id]',
                values: create_cites_list,
                current_value: nil
              },
              diploma: {
                label: 'Carga aquí tu diploma',
                name: 'educational_level[diploma]',
                current_value: expected_educational_level.diploma
              },
            },
            placeholders:{
              finish_date: 'Terminación'
            }
          }
        }

        response = subject.new(
          source: expected_educational_level,
          form_type: :educational_level,
          template_translation_path: 'users.wizards.step_nines.show',
          action_path: '/users/wizards/step_nine',
          previous_path: '/users/wizards/step_eight',
          next_path: '/users/wizards/step_ten',
          form_method: :post
        ).form_params

        expect(response[:form][:buttons]).to eq(expected_object[:form][:buttons])
        expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

        expect(response.keys).to match_array(expected_object.keys)
        expect(response).to eq(expected_object)
      end
    end

  end

end

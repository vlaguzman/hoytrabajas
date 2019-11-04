require 'rails_helper'

RSpec.describe Users::Wizards::StepThree::FormParamsService do

  describe "#form_params" do
    let!(:job_categories) { create_list(:job_category, 5) }
    let!(:offer_types) { create_list(:offer_type, 5) }
    let!(:contract_types) { create_list(:contract_type, 5) }
    let!(:work_modes) { create_list(:work_mode, 5) }
    let!(:labor_disponibilities) { create_list(:labor_disponibility, 5) }

    let(:create_job_categories_list) { ListConverter.model_list(JobCategory) }
    let(:create_offer_types_list) { ListConverter.model_list(OfferType) }
    let(:create_contract_type_list) { ListConverter.model_list(ContractType) }
    let(:create_work_mode_list) { ListConverter.model_list(WorkMode) }
    let(:create_labor_disponibilities_list) { ListConverter.model_list(LaborDisponibility) }

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
            nextPath: '/users/wizards/step_four',
            previousPath: '/users/wizards/step_two'
          },
          action: '/users/wizards/step_three',
          method: :put,
          type: :user,
          formFields: {
            job_category_ids: {
              name: 'user[curriculum_vitae][job_category_ids][]',
              label: 'Elje las categorías en las que deseas buscar trabajo',
              values: create_job_categories_list,
              current_value: ''
            },
            offer_type_ids: {
              name: 'user[curriculum_vitae][offer_type_ids][]',
              label: 'Tipo de oferta',
              values: create_offer_types_list,
              current_value: ''
            },
            contract_type_id: {
              name: 'user[curriculum_vitae][contract_type_id]',
              label: 'Acuerdo legal',
              values: create_contract_type_list,
              current_value: ''
            },
            work_mode_ids: {
              name: 'user[curriculum_vitae][work_mode_ids][]',
              label: 'Modalidad de trabajo',
              values: create_work_mode_list,
              current_value: ''
            },
            labor_disponibility_id: {
              name: 'user[curriculum_vitae][labor_disponibility_id]',
              label: 'Disponibilidad para trabajar',
              values: create_labor_disponibilities_list,
              current_value: ''
            }
          },
          placeholders: {}
        }
      }

      response = subject.new(
        form_type: :user,
        template_translation_path: "users.wizards.step_threes.show",
        action_path: "/users/wizards/step_three" ,
        previous_path: "/users/wizards/step_two",
        next_path: "/users/wizards/step_four",
        form_method: :put
      ).form_params

      expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

      expect(response.keys).to match_array(expected_object.keys)
      expect(response).to eq(expected_object)
    end
  end

end

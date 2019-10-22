require 'rails_helper'

RSpec.describe Companies::FirstOffer::StepOne::FormParamsService do

  describe "#form_params" do
    let!(:company) { create(:company, :first_time) }

    let!(:industries) { create_list(:industry, 5) }
    let(:create_industries_list) { ListConverter.model_list(Industry) }

    let!(:employees_ranges) { create_list(:employees_range, 5) }
    let(:create_employees_ranges_list) { ListConverter.model_list(EmployeesRange) }

    let(:subject) { described_class }

    it "should return the expected object" do

      expected_object = {
        title: 'Empecemos por conocernos',
        subtitle: "Brinda a tu candidato información de tu empresa.",
        form: {
          buttons: {
            submit: 'Siguiente',
            previous: 'Regresar',
            next: 'Saltar',
            nextPath: "/companies/first_offer/step_two",
            previousPath: nil
          },
          action: '/companies/first_offer/step_one',
          method: :put,
          type: :comapny,
          formFields: {
            name: {
              name: 'comapny[name]',
              label: "Nombre empresa o Razón social*"
            },
            industry_id: {
              name: 'comapny[industry_id]',
              label: "Sector al que pertenece tu empresa*",
              values: create_industries_list
            },
            contact_work_position: {
              name: 'comapny[contact_work_position]',
              label: 'Cargo'
            },
            contact_name: {
              name: 'comapny[contact_name]',
              label: "Persona de contacto"
            },
            contact_cellphone: {
              name: 'comapny[contact_cellphone]',
              label: "Número de contacto"
            },
            employees_range_id: {
              name: 'comapny[employees_range_id]',
              label: 'Número de empleados',
              values: create_employees_ranges_list
            }
          }
        }
      }

      response = subject.new(
        errors: company.errors,
        form_type: :comapny,
        template_translation_path: "companies.first_offer.step_ones.show",
        action_path: "/companies/first_offer/step_one" ,
        next_path: "/companies/first_offer/step_two",
        form_method: :put
      ).form_params

      expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

      expect(response.keys).to match_array(expected_object.keys)
      expect(response).to eq(expected_object)
    end
  end

end

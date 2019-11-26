require 'rails_helper'

RSpec.describe Companies::FirstOffer::StepTwo::FormParamsService do

  describe "#form_params" do
    let!(:company) { create(:company, :first_time) }

    let!(:industries) { create_list(:industry, 5) }
    let(:create_industries_list) { ListConverter.model_list(Industry) }

    let(:create_employees_ranges_list) { ListConverter.model_list(EmployeesRange) }

    let(:subject) { described_class }

    it "should return the expected object" do

      expected_object = {
        title: 'Empecemos por conocernos',
        subtitle: "Brinda a tu candidato información de tu empresa.",
        form: {
          buttons: {
            addOther: nil,
            submit: 'Siguiente',
            previous: 'Regresar',
            next: 'Saltar',
            nextPath: '/companies/first_offer/step_three',
            previousPath: '/companies/first_offer/step_one'
          },
          action: '/companies/first_offer/step_two',
          method: :put,
          type: :company,
          formFields: {
            description: {
              name: 'company[description]',
              label: '',
              current_value: ""
            }
          },
          placeholders: {}
        }
      }

      response = subject.new(
        errors: company.errors,
        action_path: '/companies/first_offer/step_two',
        next_path: '/companies/first_offer/step_three',
        previous_path: '/companies/first_offer/step_one',
        form_type: :company,
        template_translation_path: "companies.first_offer.step_twos.show",
        form_method: :put
      ).form_params

      expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

      expect(response.keys).to match_array(expected_object.keys)
      expect(response).to eq(expected_object)
    end
  end

end

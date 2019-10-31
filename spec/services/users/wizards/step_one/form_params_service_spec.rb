require 'rails_helper'

RSpec.describe Users::Wizards::StepOne::FormParamsService do

  describe "#form_params" do
    let!(:user) { create(:user, :first_time_candidate) }

    let!(:nationalities) { create_list(:nationality, 5) }
    let!(:document_types) { create_list(:document_type, 5) }

    let(:create_document_type_list) { ListConverter.model_list(DocumentType) }
    let(:create_nationalities_list) { ListConverter.model_list(Nationality) }

    let(:subject) { described_class }

    it "should return the expected object" do

      expected_object = {
        title: 'Empecemos por conocernos',
        subtitle: "Brinda a las empresas información valiosa sobre ti.",
        form: {
          buttons: {
            submit: 'Siguiente',
            previous: 'Regresar',
            next: 'Saltar',
            nextPath: "/users/wizards/step_two",
            previousPath: nil
          },
          action: '/users/wizards/step_one',
          method: :put,
          type: :candidate,
          formFields: {
            name:{
              name: "candidate[name]",
              label: "Nombre*",
            },
            last_name:{
              name: "candidate[last_name]",
              label: "Apellido*",
            },
            nationality_ids:{
              name:"candidate[nationality_ids][]",
              label: "Nacionalidad*",
              values: create_nationalities_list
            },
            document_type_id:{
              name:"candidate[document_type_id]",
              label: "Tipo de documento de identidad*",
              values: create_document_type_list
            },
            identification_number:{
              name:"candidate[identification_number]",
              label: "Número de documento*",
            },
            contact_number:{
              name:"candidate[contact_number]",
              label: "Número de contacto*"
            }
          },
          placeholders:{}
        }
      }

      response = subject.new(
        errors: user.errors,
        form_type: :candidate,
        template_translation_path: "users.wizards.step_ones.show",
        action_path: "/users/wizards/step_one" ,
        next_path: "/users/wizards/step_two",
        form_method: :put
      ).form_params

      expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

      expect(response.keys).to match_array(expected_object.keys)
      expect(response).to eq(expected_object)
    end
  end

end

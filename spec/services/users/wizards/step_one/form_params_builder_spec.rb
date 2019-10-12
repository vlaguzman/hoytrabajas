require 'rails_helper'

RSpec.describe Users::Wizards::StepOne::FormParamsBuilder do

  describe "#call" do
    it { should respond_to(:call) }

    let!(:nationalities) { create_list(:nationality, 5) }
    let!(:document_types) { create_list(:document_type, 5) }

    let(:create_document_type_list) { ListConverter.model_list(DocumentType) }
    let(:create_nationalities_list) { ListConverter.model_list(Nationality) }

    it "should return the expected object" do

      expected_object = {
        title: 'Empecemos por conocernos',
        subtitle: "Brinda a las empresas información valiosa sobre ti.",
        form: {
          buttons: {
            submit: 'Siguiente'
          },
          action: '/users/wizards/step_one',
          method: :put,
          type: :user,
          formFields: {
            name:{
              name: "user[name]",
              label: "Nombre*",
            },
            last_name:{
              name: "user[last_name]",
              label: "Apellido*",
            },
            nationality_ids:{
              name:"user[nationality_ids][]",
              label: "Nacionalidad*",
              values: create_nationalities_list
            },
            document_type_id:{
              name:"user[document_type_id]",
              label: "Tipo de documento de identidad*",
              values: create_document_type_list
            },
            identification_number:{
              name:"user[identification_number]",
              label: "Número de documento*",
            },
            contact_number:{
              name:"user[contact_number]",
              label: "Número de contacto*"
            }
          }
        }
      }

      response = subject.("/users/wizards/step_one")

      expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

      expect(response.keys).to match_array(expected_object.keys)
      expect(response).to eq(expected_object)
    end
  end

end
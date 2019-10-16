require 'rails_helper'

RSpec.describe Users::Wizards::StepTwo::FormParamsService do

  describe "#form_params" do
    let!(:sexes) { create_list(:sex, 5) }
    let!(:limitations) { create_list(:limitation, 5) }
    let!(:educational_degrees) { create_list(:educational_degree, 5) }

    let(:create_sex_list) { ListConverter.model_list(Sex) }
    let(:create_limitations_list) { ListConverter.model_list(Limitation) }
    let(:create_educational_degree_list) { ListConverter.model_list(EducationalDegree) }

    let(:subject) { described_class }

    it "should return the expected object" do

      expected_object = {
        title: 'Empecemos por conocernos',
        subtitle: "Brinda a las empresas información valiosa sobre ti.",
        form: {
          buttons: {
            submit: 'Siguiente',
            next_path: '/users/wizards/step_three',
            previous_path: '/users/wizards/step_one'
          },
          action: '/users/wizards/step_two',
          method: :put,
          type: :user,
          formFields: {
            about_me:{
              name: "user[about_me]",
              label: "Cuentanos un poco de ti*"
            },
            sex_id:{
              name: "user[sex_id]",
              label: "Genero",
              values: create_sex_list
            },
            birthday:{
              name: "user[birthday]",
              label: "Fecha de nacimiento"
            },
            limitation_ids:{
              name: "user[limitation_ids][]",
              label: "Tienes alguna condición especial",
              values: create_limitations_list
            },
            educational_degree_id:{
              name: "user[educational_degree_id]",
              label: "Nivel de educación*",
              values: create_educational_degree_list
            }
          }
        }
      }

      response = subject.new(
        form_type: :user,
        template_translation_path: "users.wizards.step_twos.show",
        action_path: "/users/wizards/step_two" ,
        previous_path: "/users/wizards/step_one",
        next_path: "/users/wizards/step_three",
        form_method: :put
      ).form_params

      expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

      expect(response.keys).to match_array(expected_object.keys)
      expect(response).to eq(expected_object)
    end
  end

end
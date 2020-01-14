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

    context "When user does not have data" do
      let(:user) { create(:user, :first_time_candidate,
        sex: nil
      ) }

      it "should return the expected object" do

        expected_object = {
          title: 'Empecemos por conocernos',
          subtitle: "Brinda a las empresas información valiosa sobre ti.",
          form: {
            buttons: {
              addOther: nil,
              submit: 'Siguiente',
              next: "Saltar",
              previous: "Regresar",
              nextPath: '/users/wizards/step_three',
              previousPath: '/users/wizards/step_one'
            },
            action: '/users/wizards/step_two',
            method: :put,
            type: :user,
            formFields: {
              about_me:{
                name: "user[about_me]",
                label: "Describe tu perfil*",
                current_value: nil
              },
              sex_id:{
                name: "user[sex_id]",
                label: "Genero",
                values: create_sex_list,
                current_value: nil
              },
              birthday:{
                name: "user[birthday]",
                label: "Fecha de nacimiento",
                current_value: nil
              },
              limitation_ids:{
                name: "user[limitation_ids][]",
                label: "Tienes alguna condición especial",
                values: create_limitations_list,
                current_value: []
              },
              educational_degree_id:{
                name: "user[educational_degree_id]",
                label: "Nivel de educación",
                values: create_educational_degree_list,
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

      context "When user have saved data" do
        let(:my_birthday) { Date.new(1995, 1, 13, 5) }

        let(:user_with_saved_data) { create(:user,
          birthday: my_birthday,
          about_me: "A very important person",
          limitation_ids: limitations.pluck(:id)[0],
          educational_degree_id: educational_degrees.pluck(:id)[0],
          sex_id: sexes.pluck(:id)[0]
        ) }

        it "should return the expected object" do

          expected_object = {
            title: 'Empecemos por conocernos',
            subtitle: "Brinda a las empresas información valiosa sobre ti.",
            form: {
              buttons: {
                addOther: nil,
                submit: 'Siguiente',
                next: "Saltar",
                previous: "Regresar",
                nextPath: '/users/wizards/step_three',
                previousPath: '/users/wizards/step_one'
              },
              action: '/users/wizards/step_two',
              method: :put,
              type: :user,
              formFields: {
                about_me:{
                  name: "user[about_me]",
                  label: "Describe tu perfil*",
                  current_value: "A very important person"
                },
                sex_id:{
                  name: "user[sex_id]",
                  label: "Genero",
                  values: create_sex_list,
                  current_value: sexes.pluck(:id)[0]
                },
                birthday:{
                  name: "user[birthday]",
                  label: "Fecha de nacimiento",
                  current_value: my_birthday
                },
                limitation_ids:{
                  name: "user[limitation_ids][]",
                  label: "Tienes alguna condición especial",
                  values: create_limitations_list,
                  current_value: [limitations.pluck(:id)[0]]
                },
                educational_degree_id:{
                  name: "user[educational_degree_id]",
                  label: "Nivel de educación",
                  values: create_educational_degree_list,
                  current_value: educational_degrees.pluck(:id)[0]
                }
              },
              placeholders: {}
            }
          }

          response = subject.new(
            source: user_with_saved_data,
            errors: user_with_saved_data.errors,
            form_type: :user,
            template_translation_path: "users.wizards.step_twos.show",
            action_path: "/users/wizards/step_two" ,
            previous_path: "/users/wizards/step_one",
            next_path: "/users/wizards/step_three",
            form_method: :put
          ).form_params

          expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])
        end
      end
    end

  end

end

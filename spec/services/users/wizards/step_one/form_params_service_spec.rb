require 'rails_helper'

RSpec.describe Users::Wizards::StepOne::FormParamsService do

  context "private methods" do
    let(:subject) { described_class.new }

    describe "#born_country_id_list" do
      it "should return array" do
        expect(subject.send(:born_country_id_list)).to be_empty
      end
    end

    describe "#born_state_id_list" do
      it "should return array" do
        expect(subject.send(:born_state_id_list)).to be_empty
      end
    end

    describe "#born_city_id_list" do
      it "should return array" do
        expect(subject.send(:born_city_id_list)).to be_empty
      end
    end

    describe "#residence_country_id_list" do
      it "should return array" do
        expect(subject.send(:residence_country_id_list)).to be_empty
      end
    end

    describe "#residence_state_id_list" do
      it "should return array" do
        expect(subject.send(:residence_state_id_list)).to be_empty
      end
    end

    describe "#residence_city_id_list" do
      it "should return array" do
        expect(subject.send(:residence_city_id_list)).to be_empty
      end
    end

    describe "#nationality_ids_list" do
      it "should return array" do
        expect(subject.send(:nationality_ids_list)).to be_empty
      end
    end

    describe "#document_type_id_list" do
      it "should return array" do
        expect(subject.send(:document_type_id_list)).to be_empty
      end
    end
  end

  describe "#form_params" do
    let!(:countries)      { create_list(:country, 5) }
    let!(:states)         { create_list(:state, 5) }
    let!(:cities)         { create_list(:city, 5) }
    let!(:nationalities)  { create_list(:nationality, 5) }
    let!(:document_types) { create_list(:document_type, 5) }

    let(:create_born_country_list)            { ListConverter.model_list(Country) }
    let(:create_born_state_list)              { ListConverter.model_list(State, nil, additional_key: :country_id) }
    let(:create_born_city_list)               { ListConverter.model_list(City) }
    let(:create_residence_country_list)       { ListConverter.model_list(Country) }
    let(:create_residence_state_list)         { ListConverter.model_list(State, nil, additional_key: :country_id) }
    let(:create_residence_city_list)          { ListConverter.model_list(City) }
    let(:create_document_type_list)           { ListConverter.model_list(DocumentType) }
    let(:create_nationalities_list)           { ListConverter.model_list(Nationality) }

    let(:subject) { described_class }

    context "When user does not have data saved" do
      let!(:user) { create(:user,:first_time_candidate) }

      it "should return the expected object" do

        expected_object = {
          title: 'Empecemos por conocernos',
          subtitle: "Brinda a las empresas información valiosa sobre ti.",
          form: {
            buttons: {
              addOther: nil,
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
                current_value: nil
              },
              last_name:{
                name: "candidate[last_name]",
                label: "Apellido*",
                current_value: nil
              },
              born_country_id:{
                name: "candidate[born_country_id]",
                label: "País de nacimiento*",
                values: create_born_country_list,
                current_value: nil
              },
              born_state_id:{
                name: "candidate[born_state_id]",
                label: "Departamento de nacimiento*",
                values: create_born_state_list,
                current_value: nil
              },
              born_city_id:{
                name: "candidate[born_city_id]",
                label: "Lugar de nacimiento*",
                values: create_born_city_list,
                current_value: nil
              },
              residence_country_id:{
                name: "candidate[residence_country_id]",
                label: "País de residencia*",
                values: create_residence_country_list,
                current_value: nil
              },
              residence_state_id:{
                name: "candidate[residence_state_id]",
                label: "Departamento de residencia*",
                values: create_residence_state_list,
                current_value: nil
              },
              residence_city_id:{
                name: "candidate[residence_city_id]",
                label: "Lugar de residencia*",
                values: create_residence_city_list,
                current_value: nil
              },
              nationality_ids:{
                name:"candidate[nationality_ids][]",
                label: "Nacionalidad(es)*",
                values: create_nationalities_list,
                current_value: []
              },
              document_type_id:{
                name:"candidate[document_type_id]",
                label: "Tipo de documento de identidad*",
                values: create_document_type_list,
                current_value: nil
              },
              identification_number:{
                name:"candidate[identification_number]",
                label: "Número de documento*",
                current_value: nil
              },
              contact_number:{
                name:"candidate[contact_number]",
                label: "Número de contacto*",
                current_value: nil
              }
            },
            placeholders:{}
          }
        }

        response = subject.new(
          source: user,
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

    context "When user have data" do
      let!(:user_nationalities)   { create_list(:nationality, 2) }
      let!(:user_document_type)   { create(:document_type) }
      let!(:user_born_city)       { create(:city) }
      let!(:user_residence_city)  { create(:city) }

      let(:user) { create(:user, :first_time_candidate,
        name: "Alfred",
        last_name: "Niuman",
        residence_city_id: user_residence_city.id,
        born_city_id: user_born_city.id,
        nationality_ids: user_nationalities.pluck(:id),
        contact_number: "123-321",
        identification_number: "999986",
        document_type: user_document_type
        ) }

      it "should return the expected object" do

        expected_object = {
          title: 'Empecemos por conocernos',
          subtitle: "Brinda a las empresas información valiosa sobre ti.",
          form: {
            buttons: {
              addOther: nil,
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
                current_value: "Alfred"
              },
              last_name:{
                name: "candidate[last_name]",
                label: "Apellido*",
                current_value: "Niuman"
              },
              born_country_id:{
                name: "candidate[born_country_id]",
                label: "País de nacimiento*",
                values: create_born_country_list,
                current_value: user_born_city.state.country_id
              },
              born_state_id:{
                name: "candidate[born_state_id]",
                label: "Departamento de nacimiento*",
                values: create_born_state_list,
                current_value: user_born_city.state_id
              },
              born_city_id:{
                name: "candidate[born_city_id]",
                label: "Lugar de nacimiento*",
                values: create_born_city_list,
                current_value: user_born_city.id 
              },
              residence_country_id:{
                name: "candidate[residence_country_id]",
                label: "País de residencia*",
                values: create_residence_country_list,
                current_value: user_residence_city.state.country_id
              },
              residence_state_id:{
                name: "candidate[residence_state_id]",
                label: "Departamento de residencia*",
                values: create_residence_state_list,
                current_value: user_residence_city.state_id
              },
              residence_city_id:{
                name: "candidate[residence_city_id]",
                label: "Lugar de residencia*",
                values: create_residence_city_list,
                current_value: user_residence_city.id
              },
              nationality_ids:{
                name:"candidate[nationality_ids][]",
                label: "Nacionalidad(es)*",
                values: create_nationalities_list,
                current_value: user_nationalities.pluck(:id)

              },
              document_type_id:{
                name:"candidate[document_type_id]",
                label: "Tipo de documento de identidad*",
                values: create_document_type_list,
                current_value: user_document_type.id
              },
              identification_number:{
                name:"candidate[identification_number]",
                label: "Número de documento*",
                current_value: "999986"
              },
              contact_number:{
                name:"candidate[contact_number]",
                label: "Número de contacto*",
                current_value: "123-321"
              }
            },
            placeholders:{}
          }
        }

        response = subject.new(
          source: user,
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

end

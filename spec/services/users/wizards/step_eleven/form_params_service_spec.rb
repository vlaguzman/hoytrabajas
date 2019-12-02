require 'rails_helper'

RSpec.describe Users::Wizards::StepEleven::FormParamsService do

  describe "#form_params" do
    let(:candidate) { create(:user, :first_time_candidate) }

    let(:subject) { described_class }

    it "should return the expected object" do

      expected_object = {
        title: '¡Perfecto! Has creado un perfil ganador',
        subtitle: 'Recuerda actualizar constantemente tu perfil para contar con mayores oportunidades.',
        form: {
          buttons: {
            next: 'Ir al Dashboard',
            nextPath: "/users/#{candidate.id}",
            goHomePath: '/',
            goHome: 'Ir a la página principal'
          },
          action: nil,
          method: :get,
          type: :user,
          formFields: {},
          placeholders:{}
        }
      }

      response = subject.new(
        template_translation_path: 'users.wizards.step_elevens.show',
        go_home_path: '/',
        next_path: "/users/#{candidate.id}",
      ).form_params

      expect(response[:form][:buttons]).to eq(expected_object[:form][:buttons])
      expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

      expect(response.keys).to match_array(expected_object.keys)
      expect(response).to eq(expected_object)
    end
  end

end
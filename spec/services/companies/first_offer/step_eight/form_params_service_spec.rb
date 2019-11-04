require 'rails_helper'

RSpec.describe Companies::FirstOffer::StepEight::FormParamsService do

  describe "#form_params" do
    let!(:company) { create(:company, :first_time) }

    let(:subject) { described_class }

    it "should return the expected object" do

      expected_object = {
        title: '¡Perfecto! Has creado un perfil ganador',
        subtitle: 'Recuerda actualizar constantemente tu perfil para contar con mayores oportunidades.',
        form: {
          buttons: {
            next: 'Completar mi perfil',
            nextPath: "/companies/#{company.id}",
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
        template_translation_path: 'offers.first_offer.step_eights.show',
        go_home_path: '/',
        next_path: "/companies/#{company.id}",
      ).form_params

      expect(response[:form][:buttons]).to eq(expected_object[:form][:buttons])
      expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

      expect(response.keys).to match_array(expected_object.keys)
      expect(response).to eq(expected_object)
    end
  end

end

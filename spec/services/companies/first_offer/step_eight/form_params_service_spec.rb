require 'rails_helper'

RSpec.describe Companies::FirstOffer::StepEight::FormParamsService do

  describe "#form_params" do
    let!(:company) { create(:company, :first_time) }

    let(:subject) { described_class }

    it "should return the expected object" do

      expected_object = {
        title: '¡Eso es todo! Ahora espera el mejor talento para tu empresa',
        subtitle: 'Recuerda que en tu Dashboard podrás consultar el estado de tu oferta y conocer a tus aplicantes!',
        form: {
          buttons: {
            next: 'Ir al Dashboard',
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

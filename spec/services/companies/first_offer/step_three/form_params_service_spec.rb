require 'rails_helper'

RSpec.describe Companies::FirstOffer::StepThree::FormParamsService do

  describe '#form_params' do
    let!(:company) { create(:company, :first_time) }

    let(:subject) { described_class }

    it 'should return the expected object' do

      expected_object = {
        title: 'Acerca de tu oferta',
        subtitle: '¡Llegó la hora de crear tu oferta y obtener el mejor talento!',
        confidential_tooltip: 'Con esto evitaremos hacer público en tu oferta el nombre y el logo de tu empresa.',
        form: {
          placeholders: {},
          buttons: {
            submit: 'Siguiente',
            next: 'Saltar',
            previous: 'Regresar',
            previousPath: '/companies/first_offer/step_two',
            nextPath: '/companies/first_offer/step_four',
            addOther: nil
          },
          action: '/companies/first_offer/step_three',
          method: :put,
          type: :company,
          formFields: {
            title: {
              name: 'company[title]',
              label: 'Título de tu oferta*',
              current_value: ''
            },
            confidential: {
              name: 'offer[confidential]',
              label: 'Ocultar nombre y logo de mi empresa',
              tooltip: 'Con esto evitaremos hacer público en tu oferta el nombre y el logo de tu empresa.',
              current_value: ''
            },
            description: {
              name: 'company[description]',
              label: 'Agrega una descripción detallada de tu oferta*',
              current_value: ''
            },
            job_category_ids: {
              name: 'company[job_category_ids]',
              label: 'Selecciona las categorías de tu oferta*',
              values: [],
              current_value: ''
            },
            offers_work_positions: {
              name: 'company[offers_work_positions]',
              label: 'Elige el cargo que deseas contratar',
              values: [],
              current_value: ''
            },
            job_category_image: {
              name: 'company[job_category_image]',
              label: 'Selecciona una imagen para destacar tu oferta',
              current_value: ''
            }
          }
        }
      }

      response = subject.new(
        errors: company.errors,
        action_path: '/companies/first_offer/step_three',
        next_path: '/companies/first_offer/step_four',
        previous_path: '/companies/first_offer/step_two',
        form_type: :company,
        template_translation_path: 'companies.first_offer.step_threes.show',
        form_method: :put
      ).form_params

      expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

      expect(response.keys).to match_array(expected_object.keys)
      expect(response).to eq(expected_object)
    end
  end

end

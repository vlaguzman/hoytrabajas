require 'rails_helper'

RSpec.describe Companies::FirstOffer::StepFive::FormParamsService do

  describe "#form_params" do
    let!(:company) { create(:company, :first_time) }

    let(:subject) { described_class }

    it "should return the expected object" do

      expected_object = {
        :range_value=>"true",
        :permanent_value=>"false",
        :range_description=>"Rango",
        :permanent_description=>"Fijo",
        :title=>"Conozcamos más de tu oferta",
        :subtitle=>"Brinda a tu candidato una relevante de tu empresa.",
        :content=>"Aspiración salarial",
        :form=> {
          :placeholders=> {
            :from=>"Ej: 750.000",
            :to=>"Ej: 750.000"
          },
          :buttons=> {
            :submit=>"Siguiente",
            :next=>"Saltar",
            :previous=>"Regresar",
            :previousPath=>"/companies/first_offer/step_four",
            :nextPath=>"/companies/first_offer/step_six"
          },
          :action=>"/companies/first_offer/step_five",
          :method=>:put,
          :type=>:offer,
          :formFields=>{
            :from=> {
              :name=>"offer[from]",
              :label=>"",
              :current_value=>""
            },
            :to=> {
              :name=>"offer[to]",
              :label=>"",
              :current_value=>""
            },
            :is_range=> {
              :name=>"offer[is_range]",
              :label=>"Aspiración salarial",
              :values=>[
                {:id=>"true", :description=>"Rango"},
                {:id=>"false", :description=>"Fijo"}
              ],
              :current_value=>""
            },
            :currency_id=> {
              :name=>"offer[currency_id]",
              :label=>nil,
              :values=>[],
              :current_value=>""
            },
            :salary_period_id=>{
              :name=>"offer[salary_period_id]",
              :label=>"Pago",
              :values=>[],
              :current_value=>""
            },
            :working_day_ids=>{
              :name=>"offer[working_day_ids][]",
              :label=>"¿Qué dias de la semana?",
              :values=>[],
              :current_value=>""
            },
            :available_work_day_ids=>{
              :name=>"offer[available_work_day_ids][]",
              :label=>"¿En qué jornada?",
              :values=>[],
              :current_value=>""
            },
            :job_aid_ids=>{
              :name=>"offer[job_aid_ids][]",
              :label=>"Auxilios o prestaciones asociadas a tu oferta",
              :values=>[],
              :current_value=>""
            }
          }
        }
      }

      response = subject.new(
        errors: company.errors,
        action_path: '/companies/first_offer/step_five',
        next_path: '/companies/first_offer/step_six',
        previous_path: '/companies/first_offer/step_four',
        form_type: :offer,
        template_translation_path: 'companies.first_offer.step_fives.show',
        form_method: :put
      ).form_params

      expect(response[:form][:buttons]).to eq(expected_object[:form][:buttons])
      expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

      expect(response.keys).to match_array(expected_object.keys)
      expect(response).to eq(expected_object)
    end
  end

end
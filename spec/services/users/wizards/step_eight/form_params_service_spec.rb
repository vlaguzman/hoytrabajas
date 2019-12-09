require 'rails_helper'

RSpec.describe Users::Wizards::StepEight::FormParamsService do

  describe "#form_params" do

    let!(:job_categories) { create_list(:job_category, 5) }
    let(:create_job_categories_list) { ListConverter.model_list(JobCategory) }

    let!(:technical_skills) { create_list(:technical_skill, 5) }
    let(:create_technical_skills_list ) { ListConverter.model_list(TechnicalSkill) }

    let!(:work_positions) { create_list(:work_position, 5) }
    let(:create_work_position_list ) { ListConverter.model_list(WorkPosition) }

    let!(:work_methodologies) { create_list(:work_methodology, 5) }
    let(:create_work_methodologies_list ) { ListConverter.model_list(WorkMethodology) }

    let!(:cities) { create_list(:city, 5) }
    let(:create_cities_list ) { ListConverter.model_list(City) }

    let(:subject) { described_class }

    it "should return the expected object" do

      expected_object = {
        title: 'Cuentanos un poco de tu experiencia',
        form: {
          buttons: {
            addOther: 'Agregar otra experiencia',
            submit: 'Siguiente',
            next: 'Saltar',
            previous: 'Regresar',
            previousPath: '/users/wizards/step_six',
            nextPath: '/users/wizards/step_nine',
          },
          action: '/users/wizards/step_eight',
          method: :put,
          type: :user,
          formFields: {
            job_category_id: {
              name: 'user[curriculum_vitae][work_experience][job_category_id]',
              label: 'Úbica tu empleo dentro de una categoría*',
              values: create_job_categories_list,
              current_value: '',
            },
            company_name: {
              name: 'user[curriculum_vitae][work_experience][company_name]',
              label: 'Empresa',
              current_value: ''
            },
            work_position_id: {
              name: 'user[curriculum_vitae][work_experience][work_position_id]',
              label: 'Cargo*',
              values: create_work_position_list,
              current_value: '',
            },
            work_methodology_id: {
              name: 'user[curriculum_vitae][work_experience][work_methodology_id]',
              label: 'Modalidad de trabajo',
              values: create_work_methodologies_list,
              current_value: '',
            },
            city_id: {
              name: 'user[curriculum_vitae][work_experience][city_id]',
              label: 'Ciudad',
              values: create_cities_list,
              current_value: '',
            },
            started_at: {
              name: 'user[curriculum_vitae][work_experience][started_at]',
              label: 'Fecha de inicio',
              current_value: ''
            },
            finished_at: {
              name: 'user[curriculum_vitae][work_experience][finished_at]',
              label: 'Fecha de finalización',
              current_value: ''
            },
            still_in_progress: {
              name: 'user[curriculum_vitae][work_experience][still_in_progress]',
              label: 'Altualmente laborando',
              current_value: ''
            },
            technical_skill_ids: {
              name: 'user[curriculum_vitae][work_experience][technical_skill_ids][]',
              label: 'Habilidades desempeñadas',
              values: create_technical_skills_list,
              current_value: '',
            }
          },
          placeholders:{
            finished_at: 'Terminación'
          }
        }
      }

      response = subject.new(
        template_translation_path: 'users.wizards.step_eights.show',
        action_path: '/users/wizards/step_eight',
        previous_path: '/users/wizards/step_six',
        next_path: '/users/wizards/step_nine',
        form_method: :put
      ).form_params

      expect(response[:form][:buttons]).to eq(expected_object[:form][:buttons])
      expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

      expect(response.keys).to match_array(expected_object.keys)
      expect(response).to eq(expected_object)
    end
  end

end

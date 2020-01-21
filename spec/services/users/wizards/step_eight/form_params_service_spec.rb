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
    let(:create_cities_list) { ListConverter.model_list(City) }

    let(:create_states_list) { ListConverter.model_list(State) }

    let(:subject) { described_class }

    context "When user is new and want add a work experience" do
      let!(:empty_cv) { create(:curriculum_vitae, :empty, work_experiences: []) }
      let(:new_work_experience) { build(:work_experience, :empty,
        curriculum_vitae: empty_cv,
        job_category: nil,
        work_position: nil
      ) }

      it "should return the expected object" do

        expected_object = {
          title: 'Cuentanos un poco de tu experiencia',
          form: {
            buttons: {
              addOther: 'Agregar otra experiencia',
              submit: 'Continuar',
              next: 'Saltar',
              previous: 'Regresar',
              previousPath: '/users/wizards/step_six',
              nextPath: '/users/wizards/step_nine',
            },
            action: '/users/wizards/step_eight',
            method: :post,
            type: :work_experience,
            formFields: {
              job_category_id: {
                name: 'work_experience[job_category_id]',
                label: 'Úbica tu empleo dentro de una categoría*',
                values: create_job_categories_list,
                current_value: nil
              },
              company_name: {
                name: 'work_experience[company_name]',
                label: 'Empresa*',
                current_value: nil
              },
              work_position: {
                name: 'work_experience[work_position]',
                label: 'Cargo*',
                values: create_work_position_list,
                current_value: nil
              },
              work_methodology_id: {
                name: 'work_experience[work_methodology_id]',
                label: 'Modalidad de trabajo',
                values: create_work_methodologies_list,
                current_value: nil
              },
              city_id: {
                name: 'work_experience[city_id]',
                label: 'Ciudad',
                values: create_cities_list,
                current_value: nil
              },
              state_id: {
                name: 'work_experience[state_id]',
                label: 'Departamento',
                values: create_states_list,
                current_value: nil
              },
              started_at: {
                name: 'work_experience[started_at]',
                label: 'Fecha de inicio',
                current_value: nil
              },
              finished_at: {
                name: 'work_experience[finished_at]',
                label: 'Fecha de finalización',
                current_value: nil
              },
              still_in_progress: {
                name: 'work_experience[still_in_progress]',
                label: 'Actualmente laborando',
                current_value: nil
              },
              technical_skills: {
                name: 'work_experience[technical_skills]',
                label: 'Habilidades desempeñadas',
                values: create_technical_skills_list,
                current_value: []
              }
            },
            placeholders:{
              finished_at: 'Terminación'
            }
          }
        }

        response = subject.new(
          source: new_work_experience,
          errors: new_work_experience.errors,
          form_type: :work_experience,
          template_translation_path: 'users.wizards.step_eights.show',
          action_path: '/users/wizards/step_eight',
          previous_path: '/users/wizards/step_six',
          next_path: '/users/wizards/step_nine',
          form_method: :post
        ).form_params

        expect(response[:form][:buttons]).to eq(expected_object[:form][:buttons])
        expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

        expect(response.keys).to match_array(expected_object.keys)
        expect(response).to eq(expected_object)
      end
    end

    context "When user is new and want add a work experience" do
      let!(:empty_cv) { create(:curriculum_vitae, :empty, work_experiences: []) }

      let(:expected_skills) { [technical_skills[0], technical_skills[1]] }

      let!(:expected_work_experience) { create(:work_experience,
        technical_skills: expected_skills,
        still_in_progress: true,
        company_name: "Hoy Trabajas",
        finished_at: Date.today + 1.months,
        city: cities.last,
        job_category: job_categories.last,
        work_position: work_positions.last,
        work_methodology: work_methodologies.last
      ) }

      it "should return the expected object" do

        expected_object = {
          title: 'Cuentanos un poco de tu experiencia',
          form: {
            buttons: {
              addOther: 'Agregar otra experiencia',
              submit: 'Continuar',
              next: 'Saltar',
              previous: 'Regresar',
              previousPath: '/users/wizards/step_six',
              nextPath: '/users/wizards/step_nine',
            },
            action: '/users/wizards/step_eight',
            method: :post,
            type: :work_experience,
            formFields: {
              job_category_id: {
                name: 'work_experience[job_category_id]',
                label: 'Úbica tu empleo dentro de una categoría*',
                values: create_job_categories_list,
                current_value: job_categories.last.id
              },
              company_name: {
                name: 'work_experience[company_name]',
                label: 'Empresa*',
                current_value: "Hoy Trabajas"
              },
              work_position: {
                name: 'work_experience[work_position]',
                label: 'Cargo*',
                values: create_work_position_list,
                current_value: work_positions.last.description
              },
              work_methodology_id: {
                name: 'work_experience[work_methodology_id]',
                label: 'Modalidad de trabajo',
                values: create_work_methodologies_list,
                current_value: work_methodologies.last.id
              },
              city_id: {
                name: 'work_experience[city_id]',
                label: 'Ciudad',
                values: create_cities_list,
                current_value: cities.last.id
              },
              state_id: {
                name: 'work_experience[state_id]',
                label: 'Departamento',
                values: create_states_list,
                current_value: cities.last.state.id
              },
              started_at: {
                name: 'work_experience[started_at]',
                label: 'Fecha de inicio',
                current_value: Date.today
              },
              finished_at: {
                name: 'work_experience[finished_at]',
                label: 'Fecha de finalización',
                current_value: Date.today + 1.months
              },
              still_in_progress: {
                name: 'work_experience[still_in_progress]',
                label: 'Actualmente laborando',
                current_value: true
              },
              technical_skills: {
                name: 'work_experience[technical_skills]',
                label: 'Habilidades desempeñadas',
                values: create_technical_skills_list,
                current_value: expected_skills.pluck(:description)
              }
            },
            placeholders:{
              finished_at: 'Terminación'
            }
          }
        }

        response = subject.new(
          source: expected_work_experience,
          errors: expected_work_experience.errors,
          form_type: :work_experience,
          template_translation_path: 'users.wizards.step_eights.show',
          action_path: '/users/wizards/step_eight',
          previous_path: '/users/wizards/step_six',
          next_path: '/users/wizards/step_nine',
          form_method: :post
        ).form_params

        expect(response[:form][:buttons]).to eq(expected_object[:form][:buttons])
        expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

        expect(response.keys).to match_array(expected_object.keys)
        expect(response).to eq(expected_object)
      end
    end

  end

end

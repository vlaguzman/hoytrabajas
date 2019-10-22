require 'rails_helper'

RSpec.describe Users::Wizards::StepSix::FormParamsService do

  describe "#form_params" do

    let!(:soft_skills) { create_list(:soft_skill, 5) }
    let(:create_soft_skills_list) { ListConverter.model_list(SoftSkill) }

    let!(:job_categories) { create_list(:job_category, 5) }
    let(:create_job_category_list) { ListConverter.model_list(JobCategory) }

    let!(:technical_skills) { create_list(:technical_skill, 5) }
    let(:create_technical_skills_list) { ListConverter.model_list(TechnicalSkill) }

    let!(:leves) { create_list(:level, 5) }
    let(:create_leves_list) { ListConverter.model_list(Level) }

    let!(:languages) { create_list(:language, 5) }
    let(:create_languages_list) { ListConverter.model_list(Language) }

    let(:subject) { described_class }

    it "should return the expected object" do

      expected_object = {
        title: 'Déjanos conocer tus habilidades',
        subtitle: 'Brinda a las empresas información valiosa sobre ti.',
        form: {
          buttons: {
            submit: 'Siguiente',
            next: 'Saltar',
            previous: 'Regresar',
            previousPath: '/users/wizards/step_five',
            nextPath: '/users/wizards/step_seven'
          },
          action: '/users/wizards/step_six',
          method: :put,
          type: :user,
          formFields: {
            soft_skill_ids: {
              name: 'user[curriculum_vitae][soft_skill_ids][]',
              label: 'Define tres habilidades blandas que destacarías de tu perfil*',
              values: create_soft_skills_list
            },
            job_category_id: {
              name: 'user[curriculum_vitae][job_category_id]',
              label: nil,
              values: create_job_category_list
            },
            technical_skill_id: {
              name: 'user[curriculum_vitae][technical_skill_id]',
              label: 'Define técnicas de acuerdo a tu perfil*',
              values: create_technical_skills_list
            },
            level_id: {
              name: 'user[curriculum_vitae][level_id]',
              label: nil,
              values: create_leves_list
            },
            language_id: {
              name: 'user[curriculum_vitae][language_id]',
              label: '¿Que idiomas deseas resaltar en tu perfil?',
              values: create_languages_list
            }
          },
          placeholders:{
            language_id: 'Selecciona el idioma',
            nivel_id: 'Nivel'
          }
        }
      }

      response = subject.new(
        form_type: :user,
        template_translation_path: "users.wizards.step_sixes.show",
        action_path: "/users/wizards/step_six" ,
        previous_path: "/users/wizards/step_five",
        next_path: "/users/wizards/step_seven",
        form_method: :put
      ).form_params

      expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

      expect(response.keys).to match_array(expected_object.keys)
      expect(response).to eq(expected_object)
    end
  end

end
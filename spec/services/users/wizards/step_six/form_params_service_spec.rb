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
          method: :post,
          type: :curriculum_vitae,
          formFields: {
            soft_skill_ids: {
              name: 'curriculum_vitae[soft_skill_ids][]',
              label: 'Define tres habilidades blandas que destacarías de tu perfil*',
              values: create_soft_skills_list,
              current_value: ''
            }
            #TODO Oscar uncoment when the fields reade to be showed

            #,
            #job_category_id: {
            #  name: 'curriculum_vitae[job_category_id]',
            #  label: nil,
            #  values: create_job_category_list,
            #  current_value: ''
            #},
            #technical_skill_id: {
            #  name: 'curriculum_vitae[technical_skill_id]',
            #  label: 'Define técnicas de acuerdo a tu perfil*',
            #  values: create_technical_skills_list,
            #  current_value: ''
            #},
            #level_id: {
            #  name: 'curriculum_vitae[level_id]',
            #  label: nil,
            #  values: create_leves_list,
            #  current_value: ''
            #},
            #language_id: {
            #  name: 'curriculum_vitae[language_id]',
            #  label: '¿Qué idiomas deseas resaltar en tu perfil?',
            #  values: create_languages_list,
            #  current_value: ''
            #}
          },
          placeholders:{
            language_id: 'Selecciona el idioma',
            nivel_id: 'Nivel'
          }
        }
      }

      response = subject.new(
        form_type: :curriculum_vitae,
        template_translation_path: "users.wizards.step_sixes.show",
        action_path: "/users/wizards/step_six" ,
        previous_path: "/users/wizards/step_five",
        next_path: "/users/wizards/step_seven",
        form_method: :post
      ).form_params

      expect(response[:form][:formFields]).to eq(expected_object[:form][:formFields])

      expect(response.keys).to match_array(expected_object.keys)
      expect(response).to eq(expected_object)
    end

    context "When curriculum have soft skills" do
      let!(:expected_soft_skill_ids) do
        [
          create(:soft_skill).id,
          create(:soft_skill).id,
          create(:soft_skill).id
        ]
      end

      let(:curriculum) { create(:curriculum_vitae, soft_skill_ids: expected_soft_skill_ids ) }

      it "should return the expected object" do
        expected_object = {
          form: {
            formFields: {
              soft_skill_ids: {
                name: 'curriculum_vitae[soft_skill_ids][]',
                label: 'Define tres habilidades blandas que destacarías de tu perfil*',
                values: create_soft_skills_list,
                current_value: expected_soft_skill_ids
              }
            }
          }
        }

        response = subject.new(
          source: curriculum,
          form_type: :curriculum_vitae,
          template_translation_path: "users.wizards.step_sixes.show",
          action_path: "/users/wizards/step_six" ,
          previous_path: "/users/wizards/step_five",
          next_path: "/users/wizards/step_seven",
          form_method: :post
        ).form_params

        expect(response[:form][:formFields][:soft_skill_ids]).to eq(expected_object[:form][:formFields][:soft_skill_ids])
      end
    end
  end

end

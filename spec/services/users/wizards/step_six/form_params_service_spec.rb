require 'rails_helper'

RSpec.describe Users::Wizards::StepSix::FormParamsService do

  describe "#form_params" do
    let!(:soft_skills) { create_list(:soft_skill, 5) }
    let(:create_soft_skills_list) { ListConverter.model_list(SoftSkill) }

    let!(:job_categories) { create_list(:job_category, 5) }
    let(:create_job_category_list) { ListConverter.model_list(JobCategory) }

    let!(:technical_skills) { create_list(:technical_skill, 5) }
    let(:create_technical_skills_list) { ListConverter.model_list(TechnicalSkill) }

    let!(:levels) { create_list(:level, 5) }
    let(:create_levels_list) { ListConverter.model_list(Level) }

    let!(:languages) { create_list(:language, 5) }
    let(:create_languages_list) { ListConverter.model_list(Language) }

    let(:subject) { described_class }

    it "should return the expected object" do

      expected_object = {
        title: 'Déjanos conocer tus habilidades',
        subtitle: 'Brinda a las empresas información valiosa sobre ti.',
        sub_forms: {
          technical_skills: "Define técnicas de acuerdo a tu perfil*",
          to_learn_skills: "Define qué habilidades te gustaría aprender o reforzar*",
          languages: "¿Que idiomas deseas resaltar en tu perfil?"
        },
        form: {
          buttons: {
            addOther: nil,
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
            },
            technical_skills:{
              name: :technical_skills,
              form_keys: [:curriculum_vitae, :technical_skills],
              field_keys: [:job_category_id, :technical_skill_id, :level_id],
              main_label: 'Define técnicas de acuerdo a tu perfil*',
              list_values: {
                job_category_id: create_job_category_list,
                technical_skill_id: create_technical_skills_list,
                level_id: create_levels_list
              },
              current_values: []
            },
            to_learn_skills:{
              name: :to_learn_skills,
              form_keys: [:curriculum_vitae, :to_learn_skills],
              field_keys: [:job_category_id, :technical_skill_id],
              main_label: "Define qué habilidades te gustaría aprender o reforzar*",
              list_values: {
                job_category_id: create_job_category_list,
                technical_skill_id: create_technical_skills_list
              },
              :current_values=>[]
            },
            languages:{
              name: :languages,
              form_keys: [:curriculum_vitae, :languages],
              field_keys: [:language_id, :level_id],
              main_label: "¿Que idiomas deseas resaltar en tu perfil?",
              list_values: {
                language_id: create_languages_list,
                level_id: create_levels_list
              },
              :current_values=>[]
            },
          },
          placeholders:{
            language_id: 'Selecciona el Idioma',
            level_id: 'Selecciona el Nivel',
            job_category_id: 'Selecciona la Categoria',
            technical_skill_id: 'Seleciona la Habilidad'
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

    context "When curriculum have technical skills" do
      let(:cv) { create(:curriculum_vitae) }
      let!(:expected_strong_params) do
        [create(:curriculum_vitaes_technical_skills,
          job_category_id: job_categories[0].id,
          technical_skill_id: technical_skills[0].id,
          level_id: levels[0].id,
          curriculum_vitae: cv
        ),
        create(:curriculum_vitaes_technical_skills,
          job_category_id: job_categories[0].id,
          technical_skill_id: technical_skills[1].id,
          level_id: levels[2].id,
          curriculum_vitae: cv
        ),
        create(:curriculum_vitaes_technical_skills,
          job_category_id: job_categories[2].id,
          technical_skill_id:technical_skills[2].id,
          level_id: levels[2].id,
          curriculum_vitae: cv
        )]
      end

      it "should return expected object" do
        expected_object = {
            name: :technical_skills,
            form_keys: [:curriculum_vitae, :technical_skills],
            field_keys: [:job_category_id, :technical_skill_id, :level_id],
            main_label: 'Define técnicas de acuerdo a tu perfil*',
            list_values: {
              job_category_id: create_job_category_list,
              technical_skill_id: create_technical_skills_list,
              level_id: create_levels_list
            },
            current_values: [{
              job_category_id: job_categories[0].id,
              technical_skill_id: technical_skills[0].id,
              level_id: levels[0].id
            },
            {
              job_category_id: job_categories[0].id,
              technical_skill_id: technical_skills[1].id,
              level_id: levels[2].id
            },
            {
              job_category_id: job_categories[2].id,
              technical_skill_id:technical_skills[2].id,
              level_id: levels[2].id
            }]
          }

        response = subject.new(
          source: cv,
          form_type: :curriculum_vitae,
          template_translation_path: "users.wizards.step_sixes.show",
          action_path: "/users/wizards/step_six" ,
          previous_path: "/users/wizards/step_five",
          next_path: "/users/wizards/step_seven",
          form_method: :post
        ).form_params

        expect(response[:form][:formFields][:technical_skills]).to eq(expected_object)

      end
    end

    context "When curriculum have to learn skills" do
      let(:cv) { create(:curriculum_vitae) }
      let!(:expected_to_learn_skills_params) do
        [create(:curriculum_vitaes_technical_skills,
          step_up: true,
          job_category_id: job_categories[0].id,
          technical_skill_id: technical_skills[0].id,
          curriculum_vitae: cv
        ),
        create(:curriculum_vitaes_technical_skills,
          step_up: true,
          job_category_id: job_categories[0].id,
          technical_skill_id: technical_skills[1].id,
          curriculum_vitae: cv
        ),
        create(:curriculum_vitaes_technical_skills,
          step_up: true,
          job_category_id: job_categories[2].id,
          technical_skill_id:technical_skills[2].id,
          curriculum_vitae: cv
        )]
      end

      it "should return expected object" do
        expected_object = {
            name: :to_learn_skills,
            form_keys: [:curriculum_vitae, :to_learn_skills],
            field_keys: [:job_category_id, :technical_skill_id],
            main_label: 'Define qué habilidades te gustaría aprender o reforzar*',
            list_values: {
              job_category_id: create_job_category_list,
              technical_skill_id: create_technical_skills_list,
            },
            current_values: [{
              job_category_id: job_categories[0].id,
              technical_skill_id: technical_skills[0].id,
            },
            {
              job_category_id: job_categories[0].id,
              technical_skill_id: technical_skills[1].id,
            },
            {
              job_category_id: job_categories[2].id,
              technical_skill_id:technical_skills[2].id,
            }]
          }

        response = subject.new(
          source: cv,
          form_type: :curriculum_vitae,
          template_translation_path: "users.wizards.step_sixes.show",
          action_path: "/users/wizards/step_six" ,
          previous_path: "/users/wizards/step_five",
          next_path: "/users/wizards/step_seven",
          form_method: :post
        ).form_params

        expect(response[:form][:formFields][:to_learn_skills]).to eq(expected_object)

      end
    end

    context "When curriculum have languages" do
      let(:cv) { create(:curriculum_vitae) }
      let!(:curriculum_vitaes_languages) do
        [create(:curriculum_vitaes_languages,
          language_id: languages[0].id,
          level_id: levels[0].id,
          curriculum_vitae: cv
        ),
        create(:curriculum_vitaes_languages,
          language_id: languages[0].id,
          level_id: levels[1].id,
          curriculum_vitae: cv
        ),
        create(:curriculum_vitaes_languages,
          language_id: languages[2].id,
          level_id:levels[2].id,
          curriculum_vitae: cv
        )]
      end

      it "should return expected object" do
        expected_object = {
            name: :languages,
            form_keys: [:curriculum_vitae, :languages],
            field_keys: [:language_id, :level_id],
            main_label: '¿Que idiomas deseas resaltar en tu perfil?',
            list_values: {
              level_id: create_levels_list,
              language_id: create_languages_list,
            },
            current_values: [{
              level_id: levels[0].id,
              language_id: languages[0].id,
            },
            {
              level_id: levels[1].id,
              language_id: languages[0].id,
            },
            {
              level_id: levels[2].id,
              language_id:languages[2].id,
            }]
          }

        response = subject.new(
          source: cv,
          form_type: :curriculum_vitae,
          template_translation_path: "users.wizards.step_sixes.show",
          action_path: "/users/wizards/step_six" ,
          previous_path: "/users/wizards/step_five",
          next_path: "/users/wizards/step_seven",
          form_method: :post
        ).form_params

        expect(response[:form][:formFields][:languages]).to eq(expected_object)

      end
    end
  end

end

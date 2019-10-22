require 'rails_helper'

RSpec.describe BaseFormWizardsService do
  let(:company) { create(:company) }

  describe "instance methods" do
    it { should respond_to(:form_type) }
    it { should respond_to(:template_translation_path) }
    it { should respond_to(:action_path) }
    it { should respond_to(:previous_path) }
    it { should respond_to(:next_path) }
    it { should respond_to(:form_method) }
  end

  describe "#form_params" do
    context "when the object is created correctly" do
      let(:subject) { described_class }

      it "should return a hash of params" do
        respose = subject.new(
          errors: company.errors,
          form_type: :user,
          template_translation_path: "users.wizards.step_ones.show",
          action_path: "users/wizards/step_two" ,
          previous_path: "users/wizards/step_one",
          next_path: "users/wizards/step_three",
          form_method: :put
        ).form_params

        expected_response = {
          :title=>"Empecemos por conocernos",
          :subtitle=>"Brinda a las empresas información valiosa sobre ti.",
          :form=>{
            :buttons=>{
              :nextPath=>"users/wizards/step_three",
              :previousPath=>"users/wizards/step_one",
              :submit=>"Siguiente",
              :next=>"Saltar",
              :previous=>"Regresar"},
            :action=>"users/wizards/step_two",
            :method=>:put,
            :type=>:user,
            :formFields=>{}
          }
        }

        expect(respose).to eq(expected_response)
      end
    end
  end
end

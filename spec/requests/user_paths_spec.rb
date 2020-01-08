require "rails_helper"

RSpec.describe "When user visit a wizards path in other language" do
  context "translate paths" do
    let(:candidate) { create(:user) }

    context "wizard paths" do
      let(:wizard_keys_paths) do
        [
          :step_zero,
          :step_one,
          :step_two,
          :step_three,
          :step_four,
          :step_five,
          :step_six,
          :step_seven,
          :step_eight,
          :step_nine,
          :step_ten,
          :step_eleven
        ]
      end

      it "should respond with the template" do

        sign_in candidate

        wizard_keys_paths.each do |path|
          get RoutesService.build_path(:users, :wizards, path)

          expect(response).to render_template(:show)
        end

      end
    end

    context "dashboard paths" do
      it "should respond with the template" do

        sign_in candidate

        get RoutesService.build_path(:users, :dashboard)

        expect(response).to render_template(:show)
      end
    end
  end
end
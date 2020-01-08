require "rails_helper"

RSpec.describe "When company visit a path in other language" do
  context "translate paths" do
    let(:company) { create(:company) }

    let(:offer) { create(:offer) }

    context "first offer paths" do
      let(:key_paths) do
        [
          :step_one,
          :step_two,
          :step_three,
          :step_four,
          :step_five,
          :step_six,
          :step_seven,
          :step_eight
        ]
      end

      it "should respond with the template" do

        sign_in company

        key_paths.each do |path|
          get "#{RoutesService.build_path(:companies, :first_offer, path)}?offer_id=#{offer.id}"

          expect(response).to render_template(:show)
        end

      end
    end

    context "dashboard paths" do
      it "should respond with the template" do

        sign_in company

        get RoutesService.build_path(:companies, :dashboard)

        expect(response).to render_template(:show)
      end
    end

    context "list_candidates paths" do
      it "should respond with the template" do

        sign_in company

        get "#{RoutesService.build_path(:companies, :list_candidates)}/#{offer.id}"

        expect(response).to render_template(:show)
      end
    end
  end
end
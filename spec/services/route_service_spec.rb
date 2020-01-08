require "rails_helper"

RSpec.describe RoutesService do
  describe "#build_path" do
    it "should return the traslate path" do
      expect(subject.build_path(:users, :wizards)).to eq('/candidato/registro')
    end
  end
end
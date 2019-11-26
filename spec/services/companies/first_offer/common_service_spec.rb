require 'rails_helper'

RSpec.describe Companies::FirstOffer::CommonService do

  describe "#update_source" do
    let(:offer) { create(:offer) }

    it "should return expected object" do
      expected_object = { status: :ok, data: offer }

      expect(subject.update_source(offer)).to eq(expected_object)
    end

    context "When a param is invalid" do
      let(:update_param) do
        {
          title: 'a extremally long title, Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.1' 
        }
      end

      it "Should return expeted object with status error" do
        expected_object = { status: :error, data: offer }

        expect(subject.update_source(offer, update_param)).to eq(expected_object)
      end
    end
  end

end
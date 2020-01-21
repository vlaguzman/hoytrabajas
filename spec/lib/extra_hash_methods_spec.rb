require 'rails_helper'

RSpec.describe ExtraHashMethods do
  let(:test_hash) do
    {
      name: 'test',
      last_name: 'man',
      mail: 'test@man.com'
    }
  end

  describe "#without" do
    context "When the user does not pass any key" do
      it "should be nil" do
        expect(test_hash.without()).to be_nil
      end
    end

    context "When the user unknowm key" do
      it "should return" do
        expect(test_hash.without(:favorite_color)).to be_nil
      end
    end

    context "When the user add all the keys of the hash" do
      it "Should return a empty hash" do
        expect(test_hash.without(:name, :last_name, :mail)).to be_empty
      end
    end


    context "When the user whant remove a key of hash" do
      it "should return the expected hash" do
        expected_hash = {
          name: 'test',
          last_name: 'man',
        }

        expect(test_hash.without(:mail)).to eq(expected_hash)
      end
    end
  end
end
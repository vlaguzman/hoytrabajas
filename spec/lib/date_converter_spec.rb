require 'rails_helper'

RSpec.describe DatesConverter do

  let(:test_date) { Time.new(2019, 9, 26, 10) }

  describe "#default" do
    it { should respond_to(:default) }

    it "should return '26 de Octubre del 2019'" do
      response = subject.default(date: test_date)

      expect(response).to eq("26 de Octubre del 2019")
    end
  end

end
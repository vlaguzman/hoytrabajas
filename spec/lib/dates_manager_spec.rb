require 'rails_helper'

RSpec.describe DatesManager do

  let(:test_date) { Time.new(2019, 9, 26, 10) }

  describe "#default" do
    it { should respond_to(:default) }

    it "should return '26 de Septiembre del 2019'" do
      response = subject.default(date: test_date)

      expect(response).to eq("26 de Septiembre del 2019")
    end
  end

  describe "#calculate_difference_time" do
    describe "When is need show see the difference of two dates in days or months and years" do
      context "when total_time is in days" do
        it "should return diffence with 'day(s)'" do
          response = subject.calculate_difference_time(Date.new(2019, 01, 19), Date.new(2019, 01, 01))

          expect(response).to eq("18 day(s)")
        end
      end

      context "when total_time is in months" do
        it "should return diffence with 'months(s)'" do
          response = subject.calculate_difference_time(Date.new(2019, 06, 19), Date.new(2019, 01, 01))

          expect(response).to eq("5.6 month(s)")
        end
      end

      context "when total_time is in years" do
        it "should return diffence with 'years(s)'" do
          response = subject.calculate_difference_time(Date.new(2020, 06, 19), Date.new(2019, 01, 01))

          expect(response).to eq("1.5 year(s)")
        end
      end
    end
  end
end

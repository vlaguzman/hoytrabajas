require 'rails_helper'

RSpec.describe OfferSalary, type: :model do

  describe "validations" do
    it { should validate_presence_of(:from) }
    it { should respond_to(:to) }
    it { should respond_to(:is_range) }

    it { should respond_to(:period_description) }
    it { should respond_to(:currency_description) }
  end

  describe "associations" do
    it { should belong_to(:currency) }
    it { should belong_to(:salary_period) }
    it { should belong_to(:offer) }
  end
end

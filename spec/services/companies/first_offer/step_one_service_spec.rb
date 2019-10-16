require 'rails_helper'

RSpec.describe Companies::FirstOffer::StepOneService do
  let(:company)  {create(:company) }
  let(:industry) {create(:industry) }

  let(:employees_range) {create(:employees_range) }

  it { should be_an_instance_of(Module) }

  describe "#call" do
    context "when all data is correct" do
      let(:params) do
        {
          name: 'Enterprise.com',
          industry_id: industry.id,
          contact_name: 'Ruben Cordoba',
          contact_work_position: 'CEO',
          contact_cellphone: '3101234567',
          employees_range_id: employees_range.id
        }
      end

      it "Should return a modified company" do
        modified_company = subject.(company: company, update_params: params)

        expect(Company.count).to eq(1)

        expect(modified_company[:status]).to eq(:ok)

        expect(modified_company[:data]).to be_an_instance_of(Company)

        expect(modified_company[:data].name).to eq(params[:name])

        expect(modified_company[:error]).to eq(nil)
      end
    end

    context "when all data is not correct" do
      let(:params) do
        {
          email: ''
        }
      end

      it "Should return a errors of modified company" do
        modified_company = subject.(company: company, update_params: params)

        expect(Company.count).to eq(1)

        expect(modified_company[:status]).to eq(:error)

        expect(modified_company[:data]).to be_an_instance_of(Company)

        expect(modified_company[:data].errors.details[:email]).to eq([{:error=>:blank}, {:error=>:blank}])
      end
    end
  end
end

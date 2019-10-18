require 'rails_helper'

RSpec.describe Companies::FirstOffer::StepTwoService do
  let(:company)  {create(:company) }

  it { should be_an_instance_of(Module) }

  describe "#call" do
    context "when all data is correct" do
      let(:params) do
        {
          description: 'Esta es la descripcion de mi empresa'
        }
      end

      it "Should return a modified company" do
        modified_company = subject.(company: company, update_params: params)

        expect(Company.count).to eq(1)

        expect(modified_company[:status]).to eq(:ok)

        expect(modified_company[:data]).to be_an_instance_of(Company)

        expect(modified_company[:data].description).to eq(params[:description])

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

require "rails_helper"

RSpec.describe UsersPresenter do
  before { Timecop.freeze(Date.new(2019, 11, 5)) }

  after { Timecop.return }

  let(:user) { create(:user,
    email: 'bat@man.com',
    name: 'Bruce',
    last_name: 'Wayne',
    contact_number: '100-500-3030',
    city: create(:city, description: 'Gothan')
  ) }

  let(:curriculum_vitae) { create(:curriculum_vitae, user: user) }

  let(:applied_ofers) { create_list(:applied_offer, 5, curriculum_vitae_id: curriculum_vitae.id) }

  let(:subject) { described_class.new(user) }

  describe "#dashboard_main_data" do
    it { should respond_to(:dashboard_main_data) }

    it "should return a hash with the required info to show template" do
      expect(subject.dashboard_main_data).to be_an_instance_of(Hash)
      expect(subject.dashboard_main_data).to eq({
        :name=>"Bruce",
        :last_name=>'Wayne',
        :telephone=>"100-500-3030",
        :email=>"bat@man.com",
        :location=>"Gothan",
        :last_update=>DateTime.now
      }
      )
    end
  end

  describe "#applied_offers" do
    it { should respond_to(:applied_offers) }

    it "should return a hash with the required info to show template" do
      applied_ofers

      expect(subject.applied_offers).to be_an_instance_of Array

    end
  end

end

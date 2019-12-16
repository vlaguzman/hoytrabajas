require "rails_helper"

RSpec.describe AffinityCalculator do
  let(:empty_offer) { create(:empty_offer, title: "empty_offer") }
  let(:the_offer)   { create(:offer, title: "the_offer") }

  let(:empty_user) { create(:user, :first_time_candidate, name: "empty_user") }
  let(:the_user)   { create(:user, name: "arnold")}

  let(:empty_curriculum_vitae) { create(:curriculum_vitae, :new_curriculum_vitae) }
  let(:the_curriculum_vitae)   { create(:curriculum_vitae) }

  describe "#not_nil_attributes_to_compare" do
    context "The class is Offer" do 
      context "The offer has not any data" do
        it "should return a empty hash" do
          response = subject.not_nil_attributes_to_compare(Offer, empty_offer)
          expect(response).to be_empty
        end
      end

      context "The offer has all data" do
        it "should return a hash with all the offer to compare data" do
          expected_object = {:city_id=>the_offer.city.id, 
                             :work_mode_id=>the_offer.work_mode.id, 
                             :contract_type_id=>the_offer.contract_type.id}
          response = subject.not_nil_attributes_to_compare(Offer, the_offer)
          expect(response).to eq(expected_object)
        end
      end
    end 

    context "The class is User" do 
      context "The user has not any data" do
        it "should return a empty hash" do
          response = subject.not_nil_attributes_to_compare(User, empty_user)
          expect(response).to be_empty
        end
      end

      context "The user has all data" do
        it "should return a hash with all the user to compare data" do
          expected_object = {:contract_type_id=>the_user.contract_type.id, 
                             :educational_degree_id=>the_user.educational_degree.id, 
                             :sex_id=>the_user.sex.id}
          response = subject.not_nil_attributes_to_compare(User, the_user)
          expect(response).to eq(expected_object)
        end
      end
    end 

    context "The class is Curriculum Vitae" do 
      context "The curriculum vitae has not any data" do
        it "should return a empty hash" do
          response = subject.not_nil_attributes_to_compare(CurriculumVitae, empty_curriculum_vitae)
          expect(response).to be_empty
        end
      end

      context "The curriculum vitae has all data" do
        it "should return a hash with all the user to compare data" do
          expected_object = {:city_id=>the_curriculum_vitae.city.id} 
          response = subject.not_nil_attributes_to_compare(CurriculumVitae, the_curriculum_vitae)
          expect(response).to eq(expected_object)
        end
      end
    end 
  end
  
  describe "#not_empty_list_to_compare" do
    context "The class is Offer" do
      context "The offer has not any lists" do
        it "should return a empty hash" do
        end
      end
      
      context "The offer has data in all lists" do
        it "should return a hash with all the offer lists data" do
        end
      end
    end

    context "The class is User" do
      context "The user has not any lists" do
        it "should return a empty hash" do
        end
      end
      
      context "The user has data in all lists" do
        it "should return a hash with all the user lists data" do
        end
      end
    end

    context "The class is Curriculum Vitae" do
      context "The curriculum vitae has not any lists" do
        it "should return a empty hash" do
        end
      end
      
      context "The curriculum_vitae has data in all lists" do
        it "should return a hash with all the offer lists data" do
        end
      end
    end
  end

end

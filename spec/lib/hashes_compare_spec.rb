require 'rails_helper'

RSpec.describe HashesCompare do
  describe '#compare_hashes_count' do
    let(:values_hash_a) do
      {
        name: 'Jose',
        sex: 'male',
        age: 25
      }
    end
    let(:values_hash_b) do
      {
        name: 'Maria',
        sex: 'famale',
        age: 25
      }
    end
    let(:values_hash_c) do
      {
        name: 'Maria Jose',
        sex: 'undefined',
        age: 30
      }
    end
    let(:values_hash_d) do
      {
        name: 'Rolando',
        sex: 'male',
        age: 25
      }
    end
    let(:list_hash_a) do
      {
        list_a: [1,2,4,5,6],
        list_b: ['one','two','five']
      }
    end
    let(:list_hash_b) do
      {
        list_a: [6,7,8,9],
        list_b: ['three','four']
      }
    end
    let(:list_hash_c) do
      {
        list_a: [0,10,20],
        list_b: ['cero','ten','twenty']
      }
    end
    let(:list_hash_d) do
      {
        list_a: [6,7,8,9],
        list_b: ['three','four', 'five']
      }
    end

    context "the hashes just have values" do
      context "ther are not any equal values" do
        it "should return 0" do
          expect(subject.compare_hashes_count(values_hash_a, values_hash_c)).to eq(0)
        end
      end

      context "there are one equal vales" do
        it "should return 1" do
          expect(subject.compare_hashes_count(values_hash_a, values_hash_b)).to eq(1)
        end
      end
      
      context "there are more than one equal values" do
        it "should return 2" do
          expect(subject.compare_hashes_count(values_hash_a, values_hash_d)).to eq(2)
        end
      end
    end

   context "the hashes just have lists" do
     context "there are not any equal value in the lists" do
       it "should return 0" do
          expect(subject.compare_hashes_count(list_hash_a, list_hash_c)).to eq(0)
       end
     end

     context "there are one equal value in one of the lists" do
       it "should return 1" do
          expect(subject.compare_hashes_count(list_hash_a, list_hash_b)).to eq(1)
       end
     end

     context "there are more than one equal values" do
       it "should return 2" do
          expect(subject.compare_hashes_count(list_hash_a, list_hash_d)).to eq(2)
       end
     end
   end
  end
end

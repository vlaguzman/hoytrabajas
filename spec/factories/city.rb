FactoryBot.define do
  factory :city do
    description {'Bogotá'}

    association :state, factory: :state
  end
end

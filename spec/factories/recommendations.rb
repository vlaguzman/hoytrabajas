FactoryBot.define do
  factory :recommendation do
    recommendation { "Anim magna ea esse enim sit esse tempor qui aliqua consectetur do sit magna aliquip. Enim laborum anim sint commodo commodo ea adipisicing id. Sunt ex Lorem incididunt duis ut cupidatat voluptate aliqua. Aute aute ullamco proident voluptate do. Aute dolor proident ipsum ea Lorem reprehenderit." }

    association :curriculum_vitae, factory: :curriculum_vitae
  end
end
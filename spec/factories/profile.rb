FactoryBot.define do
  factory :profile do
    name { "Carlos" }
    last_name { "Rojas" }
    nationality { nil }
    document_type { nil }
    document_number { "1063558224" }
    contact_number { "3183638789" }
    about_you { "I am the best chef in the world" }
    gender { nil }
    birthday { Date.new(1990-01-01) }
    handicap { nil }
    educational_degree { nil }
  end
end

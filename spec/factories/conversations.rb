FactoryBot.define do
  factory :conversation do
    association :person
    date { "2024-11-29" }
    body { "MyText" }
  end
end

FactoryBot.define do
  factory :person do
    association :user
    name { "ヒトノスケ_1" }
    birthday { "1990-11-20" }
    gender { "female" }
    relationship { "friend" }
    encounter_story { "出会いのきっかけは〜〜〜。" }
    image_url { "foo.png" }
  end
end

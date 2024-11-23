FactoryBot.define do
  factory :person do
    association :user
    name { "ヒトノスケ_1" }
    birth_year { 1990 }
    birth_month { 07 }
    birth_day { 03 }
    gender { "female" }
    relationship { "friend" }
    encounter_story { "出会いのきっかけは〜〜〜。" }
    image_url { "foo.png" }
  end
end

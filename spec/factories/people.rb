FactoryBot.define do
  factory :person do
    association :user
    name { "ヒトノスケ_1" }
    birth_year { 1990 }
    birth_month { 7 }
    birth_day { 3 }
    gender { "female" }
    relationship { "friend" }
    encounter_story { "出会いのきっかけは〜〜〜。" }
    image_url { "default" }
  end
end

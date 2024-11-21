module Api::V1::PeopleHelper
  def formatted_person(person)
    {
      id: person.id,
      name: person.name,
      birthday: person.birthday,
      gender: person.gender_i18n,
      relationship: person.relationship_i18n,
      encounter_story: person.encounter_story,
      image_url: person.image_url,
      created_at: person.created_at.strftime("%Y-%m-%d"),
    }
  end

  def formatted_people(people)
    people.map do |person|
      formatted_person(person)
    end
  end
end

module Api::V1::PeopleHelper
  def formatted_person(person)
    {
      id: person.id,
      name: person.name,
      birth_year: person.birth_year,
      birth_month: person.birth_month,
      birth_day: person.birth_day,
      gender: person.gender.present? ? I18n.t("enums.person.gender.#{person.gender}", locale: params[:locale] || :en) : nil,
      relationship: person.relationship.present? ? I18n.t("enums.person.relationship.#{person.relationship}", locale: params[:locale] || :en) : nil,
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

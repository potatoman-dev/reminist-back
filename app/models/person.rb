class Person < ApplicationRecord
  belongs_to :user
  has_many :conversations, dependent: :destroy
  validates :name, presence: true, length: { maximum: 100 }
  validates :birth_year, numericality: { only_integer: true }, length: { is: 4 }, allow_nil: true
  validates :birth_month, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }, length: { minimum: 1, maximum: 2 },
                          allow_nil: true
  validates :birth_day, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 31 }, length: { minimum: 1, maximum: 2 },
                        allow_nil: true

  enum gender: { male: "male", female: "female", other: "other" }, _prefix: true

  enum relationship: { family: "family", friend: "friend", acquaintance: "acquaintance", coworker: "coworker", other: "other" }, _prefix: true

  def self.new_people
    order(created_at: :desc).limit(4)
  end

  def self.upcoming_birthdays
    today = Date.today
    one_month_later = today + 1.month
    people = where.not(birth_month: nil).where.not(birth_day: nil).select do |person|
      valid_birthday?(person, today, one_month_later)
    end

    sort_by_birthday(people, today)
  end

  def self.valid_birthday?(person, today, one_month_later)
    birth_date = Date.new(today.year, person.birth_month.to_i, person.birth_day.to_i)
    birth_date = birth_date.change(year: today.year + 1) if birth_date < today

    birth_date >= today && birth_date <= one_month_later
  rescue ArgumentError, TypeError
    # 無効な誕生日データがあればスキップ
    false
  end

  def self.sort_by_birthday(people, today)
    people.sort_by do |person|
      birth_date = Date.new(today.year, person.birth_month.to_i, person.birth_day.to_i)
      birth_date = birth_date.change(year: today.year + 1) if birth_date < today
      birth_date
    end
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[name]
  end
end

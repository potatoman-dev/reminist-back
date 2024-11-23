class Person < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 100 }
  validates :birth_year, numericality: { only_integer: true }, length: { is: 4 }, allow_nil: true
  validates :birth_month, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }, length: { minimum: 1, maximum: 2 },
                          allow_nil: true
  validates :birth_day, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 31 }, length: { minimum: 1, maximum: 2 },
                        allow_nil: true

  enum gender: { male: "male", female: "female", other: "other" }, _prefix: true

  enum relationship: { family: "family", friend: "friend", acquaintance: "acquaintance", coworker: "coworker", other: "other" }, _prefix: true
end

class Person < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 100 }

  enum gender: { male: "male", female: "female", other: "other" }, _prefix: true

  enum relationship: { family: "family", friend: "friend", acquaintance: "acquaintance", coworker: "coworker", other: "other" }, _prefix: true
end

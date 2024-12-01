class Conversation < ApplicationRecord
  belongs_to :person
  validates :date, presence: true
  validates :body, presence: true
end

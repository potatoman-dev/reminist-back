# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, on: :create
  validates :password, presence: true, length: { minimum: 8 }, on: :create
  validates :password_confirmation, presence: true, length: { minimum: 8 }, on: :create

  has_many :people, dependent: :destroy
  has_many :conversations, through: :people

  def self.all_conversations
    Conversation.joins(:people).distinct
  end
end

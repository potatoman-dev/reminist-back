class Api::V1::FeedsController < ApplicationController
  wrap_parameters format: []
  before_action :authenticate_api_v1_user!

  def index
    feed = Conversation.joins(person: :user).
             where(people: { user_id: current_api_v1_user.id }).
             order(date: :desc, created_at: :desc).
             limit(15)

    feed_with_person_name = feed.map do |conversation|
      {
        id: conversation.id,
        date: conversation.date,
        person_name: conversation.person.name,
        person_id: conversation.person.id,
        body: conversation.body,
      }
    end

    render json: feed_with_person_name, status: :ok
  end
end

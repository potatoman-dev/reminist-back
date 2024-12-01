class Api::V1::ConversationsController < ApplicationController
  wrap_parameters format: []

  before_action :authenticate_api_v1_user!
  before_action :set_person

  def index
    conversations = Conversation.all
    render json: conversations, status: :ok
  end

  def create
    conversation = @person.conversations.build(conversation_params)

    if conversation.save
      render json: conversation, status: :created
    else
      render json: conversation.errors, status: :unprocessable_entity
    end
  end

  def show
    conversation = @person.conversations.find(params[:id])

    if conversation
      render json: conversation, status: :ok
    else
      render json: { errors: conversation.errors.full_messages, status: :unprocessable_entity }
    end
  end

  def update
    conversation = @person.conversations.find(params[:id])

    if conversation.update(conversation_params)
      render json: conversation, status: :ok
    else
      render json: { errors: conversation.errors.full_messages, status: :unprocessable_entity }
    end
  end

  def destroy
    conversation = @person.conversations.find(params[:id])
    if conversation.destroy
      render json: { status: :ok }
    else
      render json: { errors: conversation.errors.full_messages, status: :unprocessable_entity }
    end
  end

  private

    def conversation_params
      params.require(:conversation).permit(:person_id, :date, :body)
    end

    def set_person
      @person = current_api_v1_user.people.find(params[:person_id])
    end
end

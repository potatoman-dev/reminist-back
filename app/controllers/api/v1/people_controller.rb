class Api::V1::PeopleController < ApplicationController
  wrap_parameters format: []
  include Api::V1::PeopleHelper

  before_action :authenticate_api_v1_user!

  def index
    people = current_api_v1_user.people.select(:id, :name, :birth_year, :birth_month, :birth_day, :gender, :relationship, :encounter_story, :image_url,
                                               :created_at).order(created_at: :desc)
    formatted_people_data = formatted_people(people)
    render json: { people: formatted_people_data, status: :ok }
  end

  def create
    person = current_api_v1_user.people.new(person_params)

    if person.save
      render json: { person: formatted_person(person), status: :created }
    else
      render json: { errors: person.errors.full_messages, status: :unprocessable_entity }
    end
  end

  def show
    person = current_api_v1_user.people.find(params[:id])

    if person
      render json: { person: formatted_person(person), status: :ok }
    else
      render json: { errors: ["Person not found"], status: :not_found }
    end
  end

  private

    def person_params
      params.require(:person).permit(:name, :birth_year, :birth_month, :birth_day, :gender, :relationship, :encounter_story, :image_url)
    end
end

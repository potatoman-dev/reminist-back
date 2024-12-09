class Api::V1::PeopleController < ApplicationController
  wrap_parameters format: []
  include Api::V1::PeopleHelper

  before_action :authenticate_api_v1_user!

  def index
    people = if params[:filter] == "upcoming_birthdays"
               current_api_v1_user.people.upcoming_birthdays
             elsif params[:page].present?
               paginate_people
             else
               default_people
             end
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

  def update
    person = current_api_v1_user.people.find(params[:id])

    if person.update(person_params)
      render json: { person: formatted_person(person), status: :ok }
    else
      render json: { errors: person.errors.full_messages, status: :unprocessable_entity }
    end
  end

  def destroy
    person = current_api_v1_user.people.find(params[:id])

    if person.destroy
      render json: { status: :ok }
    else
      render json: { errors: person.errors.full_messages, status: :unprocessable_entity }
    end
  end

  private

    def person_params
      params.require(:person).permit(:name, :birth_year, :birth_month, :birth_day, :gender, :relationship, :encounter_story, :image_url)
    end

    def paginate_people
      page = params[:page].to_i
      per_page = 4
      offset = (page - 1) * per_page
      current_api_v1_user.people.select(:id, :name, :birth_year, :birth_month, :birth_day, :gender, :relationship, :encounter_story, :image_url, :created_at).
        order(created_at: :desc).limit(per_page).offset(offset)
    end

    def default_people
      current_api_v1_user.people.select(:id, :name, :birth_year, :birth_month, :birth_day, :gender, :relationship, :encounter_story, :image_url, :created_at).
        order(created_at: :desc).limit(4)
    end
end

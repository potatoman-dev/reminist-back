class Api::V1::HomeController < ApplicationController
  def index
    render json: { message: "API IS CONNECTED." }
  end
end

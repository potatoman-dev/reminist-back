class Api::V1::ConnectivityTestsController < ApplicationController
  def index
    tests = ConnectivityTest.all
    render json: tests
  end

  def show
    test = ConnectivityTest.find(params[:id])
    render json: test
  end

  def create
    test = ConnectivityTest.new(name: params[:name])
    if test.save
      render json: test, status: :created, location: api_v1_connectivity_test_url(test)
    else
      render json: { errors: test.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    test = ConnectivityTest.find(params[:id])
    if test.update(name: params[:name])
      render json: test
    else
      render json: { errors: test.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    test = ConnectivityTest.find(params[:id])
    test.destroy
    head :no_content
  end
end

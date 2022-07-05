class FlowersController < ApplicationController
  skip_before_action :authenticate_request, only: [:index]

  def index
    @flowers = Flower.all
    render json: @flowers, status: :ok
  end

  def create
    @flower = Flower.new(flower_params)
    if @flower.save
      render json: @flower, status: :created
    else
      render json: { errors: @flower.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private
  def flower_params
    params.permit(:name, :description, :image)
  end
end

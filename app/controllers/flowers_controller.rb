class FlowersController < ApplicationController
  skip_before_action :authenticate_request, only: [:index]

  def index
    @flowers = Flower.all
    render json: @flowers, status: :ok
  end

  private
  def flower_params
    params.permit(:name, :description, :image)
  end
end

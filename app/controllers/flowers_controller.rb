class FlowersController < ApplicationController
  skip_before_action :authenticate_request, only: [:index]

  def index
    @flowers = Flower.all
    render json: @flowers.map { |flower| flower.as_json.merge(image: url_for(flower.image))}, status: :ok
  end

  private
  def flower_params
    params.permit(:name, :description, :image)
  end
end

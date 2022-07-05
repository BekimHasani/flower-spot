class SightingsController < ApplicationController
  skip_before_action :authenticate_request, only: [:get_by_flower]
  before_action :set_sighting, only: [:destroy]

  def get_by_flower
    render json: Sighting.where(:flower_id => sighting_params[:flower_id]), status: :ok
  end

  def create
    @sighting = Sighting.new(sighting_params)
    if @sighting.save
      render json: @sighting, status: :created
    else
      render json: { errors: @sighting.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    if !@sighting.destroy
      render json: @sighting, status: :ok
    else
      render json: { errors: @sighting.errors.full_messages },
             status: :precondition_failed
    end
  end

  private
  def sighting_params
    params.permit(:longitude, :latitude, :user_id, :flower_id)
  end

  def set_sighting
    @sighting = Sighting.find(params[:id])
  end
end

class LikesController < ApplicationController
  before_action :set_like, only: [:destroy]

  def create
    @like = Like.new(like_params)
    if @like.save
      render json: @like, status: :created
    else
      render json: { errors: @like.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    if @like.destroy
      render json: @like, status: :ok
    else
      render json: { errors: @like.errors.full_messages },
             status: :precondition_failed
    end
  end

  private
  def like_params
    params.permit(:user_id, :sighting_id)
  end

  def set_like
    @like = Like.find(params[:id])
  end
end

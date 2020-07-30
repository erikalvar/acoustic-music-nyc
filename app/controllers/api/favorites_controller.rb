class Api::FavoritesController < ApplicationController

  before_action :authenticate_user
  
  def index
    @favorites = Favorite.all
    render "index.json.jb"
  end

  def create
    @favorite = Favorite.new(
      user_id: current_user.id,
      event_id: params[:event_id],
    )
    if @favorite.save
      render "show.json.jb"
    else
      render json: {errors: @favorite.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @favorite = Favorite.find_by(id: params[:id])
    if @favorite
      render "show.json.jb"
    else
      render json: {errors: "favorite does not exist."}, status: :unprocessable_entity
    end
  end

  def destroy
    @favorite = Favorite.find_by(id: params[:id])
    @favorite.destroy
    render json: {message: "favorite successfully deleted."}
  end

end

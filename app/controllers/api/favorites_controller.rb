class Api::FavoritesController < ApplicationController

  before_action :authenticate_user

  def already_favorited?
    Favorite.where(user_id: current_user.id, event_id:
    params[:event_id]).exists?
  end
  
  def index
    @favorites = Favorite.all
    render "index.json.jb"
  end

  def create
    if already_favorited?
      render json: {message: "alreaded favorited"}
    else
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
    if !(already_favorited?)
      render json: {message: "not yet favorited"}
    else
      @favorite = Favorite.find_by(id: params[:id])
      @favorite.destroy
      render json: {message: "favorite successfully deleted."}
    end
  end

end

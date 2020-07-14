class Api::UsersController < ApplicationController

  before_action :authenticate_user, except: :create

  def create
    @user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      moderator: false
    )
    if @user.save
      render "show.json.jb"
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render "show.json.jb"
    else
      render json: {errors: "User does not exist."}, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user == current_user
      @user = current_user
      @user.username = params[:username] || @user.username
      @user.email = params[:email] || @user.email
      @user.moderator = params[:moderator] || @user.moderator

      if params[:password]
        @user.password = params[:password] || @user.password
        @user.password_confirmation = params[:password_confirmation] || @user.password_confirmation
      end
      
      if @user.save
        render "show.json.jb"
      else
        render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
      end

    else
      render json: { message: "User not logged in" }, status: :unprocessable_entity
    end 
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    render json: {message: "User successfully deleted."}
  end

end

class Api::UsersController < ApplicationController

  def create
    @user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      moderator: params[:moderator]
    )
    if @user.save
      render json: { message: "User successfully created" }, status: :created
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
    @user.username = params[:username] || @user.username
    @user.email = params[:email] || @user.email
    @user.password = params[:password] || @user.password
    @user.password_confirmation = params[:password_confirmation] || @user.password_confirmation
    @user.moderator = params[:moderator] || @user.moderator
    if @user.save
      render json: { message: "User successfully updated" }, status: :ok
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    render json: {message: "User successfully deleted."}
  end

end

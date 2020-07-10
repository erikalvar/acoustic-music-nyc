class Api::TagsController < ApplicationController

  def index
    @tags = Tag.all
    render "index.json.jb"
  end

  def show
    @tag = Tag.find_by(id: params[:id])
    if @tag
      render "show.json.jb"
    else
      render json: {errors: "tag does not exist."}, status: :unprocessable_entity
    end
  end
  
end

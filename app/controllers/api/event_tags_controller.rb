class Api::EventTagsController < ApplicationController

  before_action :authenticate_user, except: :show

  def create
    @event_tag = EventTag.new(
      event_id: params[:event_id],
      tag_id: params[:tag_id],
    )
    if @event_tag.save
      render "show.json.jb"
    else
      render json: {errors: @event_tag.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @event_tag = EventTag.find_by(id: params[:id])
    if @event_tag
      render "show.json.jb"
    else
      render json: {errors: "Event_tag does not exist."}, status: :unprocessable_entity
    end
  end

  def destroy
    @event_tag = EventTag.find_by(id: params[:id])
    @event_tag.destroy
    render json: {message: "Event_tag successfully deleted."}
  end

end

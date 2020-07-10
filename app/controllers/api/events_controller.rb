class Api::EventsController < ApplicationController

  def index
    @events = Event.all
    render "index.json.jb"
  end

  def create
    @event = Event.new(
      title: params[:title],
      venue: params[:venue],
      venue_address: params[:venue_address],
      description: params[:description],
      tickets_url: params[:tickets_url],
      image_url: params[:image_url],
      user_id: params[:user_id],
      moderator_id: params[:moderator_id],
      start_time: params[:start_time],
      end_time: params[:end_time]
    )
    if @event.save
      render "show.json.jb"
    else
      render json: {errors: @event.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    if @event
      render "show.json.jb"
    else
      render json: {errors: "Event does not exist."}, status: :unprocessable_entity
    end
  end

  def update
    @event = Event.find_by(id: params[:id])
    @event.title = params[:title] || @event.title
    @event.venue = params[:venue] || @event.venue
    @event.venue_address = params[:venue_address] || @event.venue_address
    @event.description = params[:description] || @event.description
    @event.tickets_url = params[:tickets_url] || @event.tickets_url
    @event.image_url = params[:image_url] || @event.image_url
    @event.user_id = params[:user_id] || @event.user_id
    @event.moderator_id = params[:moderator_id] || @event.moderator_id
    @event.start_time = params[:start_time] || @event.start_time
    @event.end_time = params[:end_time] || @event.end_time
    if @event.save
      render "show.json.jb"
    else
      render json: {message: @event.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    @event.destroy
    render json: {message: "Event successfully deleted."}
  end

end

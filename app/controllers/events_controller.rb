class EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @all_events = Event.all
    @user = current_user
  end

  def new
    @event = Event.new('start_date' => params[:start_date], 'duration' => params[:duration], 'title' => params[:title], 'description' => params[:description], 'price' => params[:price], 'location' => params[:location])
  end

  def create
    @event = Event.new(event_params)
    @event.admin_id = current_user.id
    if @event.save!
      redirect_to root_path
    else
      render :new
    end
    puts "*********"
    puts params[:start_date]
    puts "*********"
    puts params[:duration]
    puts "*********"
    puts params[:description]
    puts "*********"
    puts params[:location]
    puts "*********"
  end

  def show
    @event = Event.find(params[:id])
  end

  private 

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location)
  end
end

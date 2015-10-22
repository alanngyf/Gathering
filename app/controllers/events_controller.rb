class EventsController < ApplicationController
  def index
  	@us_states = us_states
  	@user = User.find(session[:user_id])
  	@events = Event.all
  	@users = User.all
  	@joins = Join.all
  end

  def show
  	@event = Event.find(params[:id])
  	@host = User.where(id: @event.user_id).first.first_name
  	@joins = Join.where(event_id: params[:id])
  	@users = User.all
    @messages = @event.messages
  end

  def create
  	@event = Event.create(name: params[:name], date: params[:date], city: params[:city], state: params[:state], user_id: session[:user_id])
  	if @event
  		redirect_to events_path
  	else
  		flash[:add_event_errors] = @event.errors.full_messages
  		redirect_to events_path
  	end
  end

  def us_states
	["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
  end
end

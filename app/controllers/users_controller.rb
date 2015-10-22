class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
    @us_states = us_states
  end

  def create
    @user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], city: params[:city], state: params[:state], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.id
        session[:user_id] = @user.id
        session[:log_in] = true
        session[:state] = @user.state
        redirect_to events_path
    else
        flash[:errors] = @user.errors.full_messages
        redirect_to new_session_path
    end
  end

  def update
    # fail
    user = User.find(params[:id])
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.email = params[:email]
    user.city = params[:city]
    user.state = params[:state]
    user.save
    # user.update(first_name: params[:frist_name], last_name: params[:last_name], email: params[:email], city: params[:city], state: params[:state])
    session[:state] = user.state
    redirect_to events_path
  end

  def us_states
    ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
  end
end

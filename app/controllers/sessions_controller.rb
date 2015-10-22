class SessionsController < ApplicationController
  # before_action :require_login, except: [:new, :create]
  def new
  	@us_states = us_states
  end

  def sign_in
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @user
        session[:user_id] = @user.id
        session[:log_in] = true
        session[:state] = @user.state
        redirect_to events_path
    else
        flash[:errors] = "Invalid email/password combination"
        # session[:errors] = "Invalid email/password combination"
        redirect_to new_session_path
    end
  end

  def log_out
    # session[:log_in] = false
    # session[:user_id] = nil
    reset_session
    redirect_to new_session_path
  end

  def us_states
   ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
  end
end

class JoinsController < ApplicationController
	def update
		Join.create(user_id: session[:user_id], event_id: params[:id])
		redirect_to events_path
	end

	def destroy
		Join.where({user_id: params[:user_id], event_id: params[:event_id]}).first.destroy
		redirect_to events_path
	end
end

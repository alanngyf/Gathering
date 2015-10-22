class MessagesController < ApplicationController
	def create
		Message.create(content: params[:content], user_id: session[:user_id], event_id: params[:event_id])
		redirect_to event_path(params[:event_id])
	end

end
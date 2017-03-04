class Users::NotificationsController < ApplicationController
	before_action :set_notification, only: [:update]

	def index
		@notification = User.find(current_user.id).notifications
		render json: @notification, include: ['series']
	end

	def update
	  if @notification.update(notification_params)
	    render json: @notification
	  else
	    render json: @notification.errors, status: :unprocessable_entity
	  end
	end

	private
    def set_notification
      @notification = User::Notification.find(params[:id])
    end

	def notification_params
		return ActiveModelSerializers::Deserialization.jsonapi_parse(params)
	end	
end
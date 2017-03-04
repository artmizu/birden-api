class SubscriptionsController < ApplicationController
	before_action :set_subscription, only: [:destroy]

	def create
		@subscription = Subscription.new(subscription_params)
		if @subscription.save
		  render json: @subscription, status: :created, location: @subscription
		else
		  render json: @subscription.errors, status: :unprocessable_entity
		end
	end

	def index
		if params[:filter].present?
			@subscription = Subscription.where(user_id: params[:filter][:user_id], anime_id: params[:filter][:anime_id]).first
			render json: @subscription
		else 
			render json: { data: "Нет параметров запроса" }
		end
	end

	def destroy
		@subscription.destroy
	end

	private

	def set_subscription
		@subscription = Subscription.find(params[:id])
	end

	def subscription_params
	  ActiveModelSerializers::Deserialization.jsonapi_parse(params)
	end
end

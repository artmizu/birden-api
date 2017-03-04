class Anime::ScoresController < ApplicationController

	def create
		@score = Anime::Score.new(score_params)
		if @score.save
		  render json: {"data": {"id": "222", "type": "api"}}
		else
		  render json: @score.errors, status: :unprocessable_entity
		end
	end

	def update
		@score = Score.find(params[:id])
		if @score.update(score_params)
		  render json: @score
		else
		  render json: @score.errors, status: :unprocessable_entity
		end
	end

	private
	
    def score_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end

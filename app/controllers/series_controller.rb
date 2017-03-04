class SeriesController < ApplicationController
  before_action :set_series, only: [:show, :update, :destroy]
  before_action :is_admin, only: [:create, :update, :destroy]

  # GET /series
  def index
    @series = Series.all

    render json: @series
  end

  # GET /series/1
  def show
    render json: @series
  end

  # POST /series
  def create
    @series = Series.new(series_params)
    @series.save!

    video = VideoEncode.new(@series.video.current_path, @series.id)
    @series.duration = video.duration
    @series.thumb = video.thumb
    @series.cover = video.cover

    if @series.save
      @series.anime.users.each do |user|
        user.notifications.create({ user_id: user.id, series_id: @series.id }).save!
      end
      render json: @series, status: :created, location: @series
    else
      render json: @series.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /series/1
  def update
    if @series.update(series_params)
      render json: @series
    else
      render json: @series.errors, status: :unprocessable_entity
    end
  end

  # DELETE /series/1
  def destroy
    @series.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series
      @series = Series.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def series_params
      res = ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      res
    end
end
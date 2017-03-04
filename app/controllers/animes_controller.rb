class AnimesController < ApplicationController
  before_action :set_anime, only: [:show, :update, :destroy]
  before_action :is_admin, only: [:create, :update, :destroy]

  def nokogiri
    parser = Parser.new
    render json: parser.collect_data(params[:url])
  end

  def video_preview
    episode = Series.find(params[:series_id])
    anime = Anime.find(params[:anime_id])
    video_preview_generator(episode, anime)
  end

  def factory
    parser = Parser.new
    render json: parser.factory("500", "530")
  end

  # GET /animes
  def index
    if params[:genre].present?
      @animes = Genre.where(name: params[:genre]).first
      @animes = @animes.animes
    elsif params[:recommended].present?
      @animes = Anime.includes(:genres).where(genres: { name: "Школа"}).limit(1)
    else
      @animes = Anime.all
    end
    render json: @animes
  end

  # GET /animes/1
  def show
    is_subscribe = @anime.subscriptions.exists?(user_id: current_user.id)
    score = @anime.scores
    render json: @anime, include: ['series', 'genres', 'users', 'scores'], meta: {
      is_subscribe: is_subscribe,
      average_score: math_score(score)
    }
  end

  # POST /animes
  def create
    @anime = Anime.new(anime_params)
    if @anime.save
      render json: "Средний показатель"
    else
      render json: @anime.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /animes/1
  def update
    if @anime.update(anime_params)
      render json: @anime
    else
      render json: @anime.errors, status: :unprocessable_entity
    end
  end

  # DELETE /animes/1
  def destroy
    @anime.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anime
      @anime = Anime.find(params[:id])
    end

    def anime_params
      params = params.permit(:cover, :title, :manufacturer, :date, :anime_type, :description, :video_preview)
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end

    def video_preview_generator(episode, anime)
      video = VideoEncode.new(episode.video.current_path, params[:anime_id])
      anime.video_preview = video.video_preview

      anime.series.update_all(is_video_preview: false)
      episode.is_video_preview = true
      episode.save
      anime.save
    end

    def math_score(score)
      length, total = [score.length, 0]
      return nil if length == 0
      score.map { |item| total += item.value }
      return total / length
    end
end

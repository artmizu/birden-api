class GenresController < ApplicationController
  before_action :set_genre, only: [:show, :update, :destroy]
  before_action :is_admin, only: [:create, :update, :destroy]

  # GET /genres
  def index
    # Перенести в отдельный экшен поиск жанров и их добавление для добавления аниме
    @genres = nil;
    if params[:name].present?
      @search = Genre.where(name: params[:name]).first
      if @search.nil?
        @genres = Genre.create!(name: params[:name])
      else
        @genres = @search
      end 
    else 
      @genres = Genre.all
    end

    render json: @genres
  end

  # GET /genres/1
  def show
    render json: @genre
  end

  # POST /genres
  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      render json: @genre, status: :created, location: @genre
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /genres/1
  def update
    if @genre.update(genre_params)
      render json: @genre
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  # DELETE /genres/1
  def destroy
    @genre.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = Genre.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def genre_params
      params.fetch(:genre, {})
    end
end

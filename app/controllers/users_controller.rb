class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :is_admin, only: [:update, :destroy]

  # GET /users/
  def index 
    if params[:me]
      render json: current_user, include: ['notifications', 'subscriptions']
    else 
      render json: 'xyu'
    end
  end

  # GET /users/1
  def show
    render json: @user, include: ['notifications']
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      # проверять параметры при получении как-то так params.require(:auth).permit :email, :password

      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end

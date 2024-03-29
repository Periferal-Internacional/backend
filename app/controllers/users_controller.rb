class UsersController < ApplicationController
  wrap_parameters :user, include: [:username, :password, :password_confirmation, :name, :lastName1, :lastName2, :position, 
                                   :admin, :super_user, :plant_id, :xp_ji, :xp_jr, :xp_jm, :business, :general_area, :superior_department, 
                                   :department, :arca_id, :email, :cap_operators, :total_operators, :mdp_b4, :mdp_aft, :waste_b4, 
                                   :waste_aft, :format_b4, :format_aft, :improvements]

  before_action :authorize_request, except: :create
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @users = User.all
    @userArray = []
    @users.each do |user|
      user_hash = {}
      user_hash["user"] = user
      user_hash["plant"] = user.getPlant()
      @userArray.push(user_hash)
    end
    render json: @userArray
  end

  # GET /users/1
  def show
    render json: @user
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

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :name, :lastName1, :lastName2, :position, 
                                   :admin, :super_user, :plant_id, :xp_ji, :xp_jr, :xp_jm, :business, :general_area, :superior_department, \
                                   :department, :arca_id, :email, :cap_operators, :total_operators, :mdp_b4, :mdp_aft, :waste_b4, 
                                   :waste_aft, :format_b4, :format_aft, :improvements)
    end
end

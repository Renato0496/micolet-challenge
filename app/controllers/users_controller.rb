class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
    @preferences = Preference.all    
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create    
    @user = User.new()
    @user.email = user_params[:email] 
    @ids = user_params[:preference_ids]
    
    respond_to do |format|
      if @ids
        @ids.each { |id| @user.preferences.push(Preference.find(id.to_i)) }      
      end      
      if @user.save
        format.html { redirect_to success_path }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, preference_ids: [])
  end

end

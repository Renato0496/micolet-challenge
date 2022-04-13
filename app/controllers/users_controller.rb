class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy ]

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
    pp user_params
    @user = User.new(user_params)
    ids = params[:preferences_ids]
    
    respond_to do |format|
      if ids
        ids.each { |id| @user.preferences.push(Preference.find(id.to_i)) }      
      end
      if @user.save
        UserMailer.with(user: @user).welcome_email.deliver_later
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email)
  end
end

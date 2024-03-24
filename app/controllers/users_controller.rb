class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, only: [:new]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /profile
  def show_profile
    @user = User.find(current_user.id)
  end

  # GET /users/1/posts/5
  def show_post
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    puts "@user: #{@user.inspect}"
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if !admin? && current_user.id != params[:id].to_i
      redirect_back fallback_location: "/users/#{current_user.id}/edit", alert: "You try to access not your profile."
    end
  end

  # POST /users or /users.json
  def create
    puts "PARAMS = " + user_params.to_s
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      # puts "role id = " + params[:user][:role_id].to_s
      # puts "role ADMIN = " + Role.find_by_name("ADMIN").id.to_s
      # puts "is admin " + (params[:user][:role_id].to_s == Role.find_by(name: "ADMIN").id.to_s).to_s
      # puts "is karaziner " + params[:user][:email].ends_with?('@karazin.ua').to_s
      if params[:user][:role_id].to_s == Role.find_by(name: "ADMIN").id.to_s && !params[:user][:email].ends_with?('@karazin.ua')
        format.html { redirect_back fallback_location: "/users/#{params[:user][:id]}/edit", alert: "You are not authorized to perform this action." }
        format.html { flash.now[:alert] = "You are not authorized to perform this action."; render :edit, status: :unprocessable_entity }
        format.json { render json: { error: "You are not authorized to perform this action." }, status: :unauthorized }
      elsif @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def admin?
    current_user&.admin?
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email, :password, :role_id)
  end

end

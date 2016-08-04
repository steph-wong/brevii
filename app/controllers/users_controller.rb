class UsersController < ApplicationController
  before_action :set_user,        only:   [:show, :edit, :update, :destroy]
  before_action :require_login,   only:   [:edit, :update, :destroy]
  before_action :correct_user,    only:   [:show, :edit, :update, :destroy]
  before_action :require_logout,  only:   [:new]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    @summaries = @user.summaries.paginate(page: params[:page])
   end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(permitted_user_params)
    @user.save

    respond_to do |format|
      if @user.save
        log_in(@user)
        format.html { redirect_to @user, notice: 'User successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def permitted_user_params
      params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
    end

    def require_login
      unless logged_in?
        store_location
        flash[:danger] = "Log in to access this page."
        redirect_to root_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        flash[:warning] = "No peeking."
        redirect_to root_url
      end
    end

    def require_logout
      if logged_in?
        flash[:warning] = "You're already a registered user."
        redirect_back fallback_location: current_user
    end
  end


end

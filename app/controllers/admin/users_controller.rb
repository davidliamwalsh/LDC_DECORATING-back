class Admin::UsersController < Admin::ApplicationController
  before_action :find_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def edit
  end

  def index
    @users = User.order(:title).page(params[:page])
  end

  def create
    @user = User.new(user_params)
    @user.image.attach(user_params[:image])

    if @user.save
      redirect_to admin_users_path, status: :found, notice: "User successfully created!"
    else
      render :new 
    end
  end

  def update
    @user.attributes = user_params
    
    if @user.save
      redirect_to admin_users_path, notice: "User successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy

    redirect_to admin_users_path, notice: "User successfully deleted!"
  end

  private

  def user_params
    params.require(:user).permit(:title, :subtitle, :body, :image, :email, :linkedin)
  end

  def find_user
    @user = User.friendly.find(params[:id])
  end

end
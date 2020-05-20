class UsersController < ApplicationController


  before_action :authenticate_user!

  before_action :correct_user, only: [:edit]


  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
  	@user = User.find(params[:id])
    @users = User.all
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    redirect_to user_path(current_user) if @user != current_user
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
  		redirect_to user_path(@user.id)
    else
      flash[:notice] = "error"
      render :edit
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :profile_image_id ,:introduction)
  end

  def correct_user
    user = User.find(params[:id])
    if user != current_user
      redirect_to user_path(current_user)
      flash[:notice] = "error"
    end
  end

end

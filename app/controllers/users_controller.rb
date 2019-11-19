class UsersController < ApplicationController
  before_action :authenticate_user!

  before_action :corrent_user, only: [:edit,:update]
  def corrent_user
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end


  def index
    @users = User.all
    @book_new = Book.new
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:notice] = "Book was successfully updated."
    else
      render action: :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @book_new = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
  end

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end

end

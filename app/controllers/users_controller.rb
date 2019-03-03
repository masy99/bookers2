class UsersController < ApplicationController
  before_action :authenticate_user!,only:[:index,:new,:show]

  def new
    @Books = Book.new
  end

  def index
  	@book = Book.new
  	@books = Book.all
    @User = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to books_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:success] = "successfully"
    else
      render :action => "edit"
    end
  end

  def top

  end

  private

  def user_params
  	params.require(:user).permit(:name, :image, :introduction)
  end
end

class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to @user, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "更新しました"
      redirect_to user_path
    else
      flash.now[:danger] = "編集に失敗しました"
      render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation,:image)
  end


end

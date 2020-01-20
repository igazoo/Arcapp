class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index,:edit, :update,:destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy


  def index
     @users = User.paginate(page: params[:page], per_page: 6).search(params[:search])
  end

  def show
    @user = User.find(params[:id])
  end

  def recommendation_show
    @user = User.find(params[:id])
    @recommendations= Recommendation.where(user_id: @user.id)
    

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
  def following
   @title = "Following"
   @user  = User.find(params[:id])
   @users = @user.following.paginate(page: params[:page],per_page: 6)

   render 'show_following'
 end

 def followers
   @title = "Followers"
   @user  = User.find(params[:id])
   @users = @user.followers.paginate(page: params[:page],per_page: 6)

   render 'show_followers'
 end

 def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
 end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation,:image)
  end

  # ログイン済みユーザーかどうか確認
   def logged_in_user
     unless logged_in?
       store_location
       flash[:danger] = "Please log in."
       redirect_to login_url
     end
   end

  # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
       redirect_to(root_url) unless current_user?(@user)
    end

    # 管理者かどうか確認
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end

class RecommendationsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
  def index
    @recommendations = Recommendation.all
  end



  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation  = Recommendation.new(recommendation_params)
    @recommendation.user_id= current_user.id
    if @recommendation.save
      redirect_to recommendation_show_user_path(current_user.id), success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end


  def destroy
    @recommendation = Recommendation.find_by(id: params[:id])
    @recommendation.delete

    redirect_to recommendation_show_user_path(current_user), danger: 'オススメを削除しました'
  end

  private
  def  recommendation_params
    params.require(:recommendation).permit(:name,:url,:description,:image)
  end
end

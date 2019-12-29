class RecommendationsController < ApplicationController

  def index
    @recommendations = Recommendation.all
  end
  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation  = Recommendation.new(recommendation_params)
    if @recommendation.save
      redirect_to recommendations_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end


  def destroy
  end

  private
  def  recommendation_params
    params.require(:recommendation).permit(:name,:url,:description,:image)
  end
end

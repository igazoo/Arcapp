class FavoritesController < ApplicationController
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.recommendation_id = params[:recommendation_id]

    if favorite.save
      redirect_to recommendation_show_user_path(current_user), success: 'お気に入りに登録しました'
    else
      redirect_to recommendation_show_user_path(current_user), danger: 'お気に入りに登録に失敗しました'
    end
  end

    def destroy
      @favorite=Favorite.find_by(user_id: current_user.id,recommendation_id: params[:recommendation_id])
      @favorite.destroy

      redirect_to recommendation_show_user_path(current_user), danger: 'いいねを外しました'

    end

end

class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner = current_user#
    if @group.save
      flash[:success] = "コミュニティを作成しました"
      redirect_to groups_path
    else
      flash[:info]= "コミュニティを作成できませんでした"
      rtender :new
    end

    def edit
    end
  end
  private
  def group_params
    params.require(:group).permit(:name)
  end



end

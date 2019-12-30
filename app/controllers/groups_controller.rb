class GroupsController < ApplicationController


  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @users = @group.users
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner = current_user.id
    if @group.save
      flash[:success] = "コミュニティを作成しました"
      redirect_to groups_path
    else
      flash[:info]= "コミュニティを作成できませんでした"
      render :new
    end
  end

    def edit
      @group = Group.find(params[:id])
    end

    def update
      @group = Group.find(params[:id])
      if @group.update_attributes(group_params)
        flash[:success] = "変更しました"
        redirect_to group_path
        else
        render 'edit'
        end
    end


  private
  def group_params
    params.require(:group).permit(:name,:description)
  end



end

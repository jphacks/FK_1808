class GroupsController < ApplicationController
  def index
  end

  def edit
    @group = Group.find(params[:id])
  end

  def show 
    @group = Group.find(params[:id])
    respond_to do |format|
      format.json {
        render json: @group
      }
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.book
      flash[:alert] = "すでに予約が完了しているグループです。"
      redirect_to root_path and return
    end
    date = @group.start
    start = DateTime.new(Integer(date.year), Integer(date.month), Integer(date.day),
                       Integer(params[:group]["start(4i)"]), Integer(params[:group]["start(5i)"]))
    if @group.update_attributes(start: start, store_name: params[:group][:store_name],
                               url: params[:group][:url], book: true,
                               location: params[:group][:location])
      redirect_to root_path
    end
  end

  def groups
    @groups = Group.where(book: false)
    respond_to do |format|
      format.json {
        res = []
        @groups.each do |group|
          res << {id: group.id, title: group.prefecture, start: group.start }
        end
        render json: res
      }
    end
  end

  private 
  def group_params
    params.require(:group).permit(:store_name, :url, :location)
  end
  
end

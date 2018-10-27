class GroupsController < ApplicationController
  def index
  end

  def groups
    @groups = Group.where(book: false)
    respond_to do |format|
      format.json {
        res = []
        @groups.each do |group|
          res << {title: group.url, start: group.start}
        end
        render json: res
        
      }
    end
  end
  
end

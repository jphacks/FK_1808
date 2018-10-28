class StaticPagesController < ApplicationController
  def index
    unless current_user
      redirect_to "/groups"
    end
  end
end

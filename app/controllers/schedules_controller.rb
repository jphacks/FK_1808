class SchedulesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
  end
  def create
    date = DateTime.new(Integer(params[:date][:year]), Integer(params[:date][:month]), Integer(params[:date][:day]))
    @schedule = current_user.schedules.find_by(start: date)
    @schedule = current_user.schedules.build(start: date, title: "予定なし", prefecture: params[:prefecture]) unless @schedule
    if @schedule.save
      date = @schedule.start.to_s.split(" ")[0]
      @group = Group.where(start: date).last
      if @group
        if @group.users.count >= 4
          @group = Group.create(prefecture: @schedule.prefecture, start: @schedule.start)
        end
      else 
        @group = Group.create(prefecture: @schedule.prefecture, start: @schedule.start)
      end
      @group.users << @schedule.user
      render json: @schedule.to_json(only: [:title, :start])
    else
      
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    if @schedule.destroy
      render json: {status: 200}
    end
  end

  def events
    @schedules = current_user.schedules
    @groups = current_user.groups.where(book: true)
    respond_to do |format|
      format.json {
        res = []
        @schedules.each do |schedule|
          res << {id: schedule.id, title: schedule.prefecture, start: schedule.start}
        end
        @groups.each do |group|
          res << {id: group.id, title: group.store_name, start: group.start, color: "red"}
        end
        render json: res 
      }
    end
  end

  private
  def schedule_params
    params.require(:date).permit(:year, :month, :day)
  end
end

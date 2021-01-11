class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
    @room = Room.find(params[:room_id])
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  private
  def schedule_params
    params.require(:schedule).permit(:name).merge(room_id: params[:room_id])
  end
end

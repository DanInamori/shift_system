class SchedulesController < ApplicationController
  before_action :set_room

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to room_path(@room.id)
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

  def set_room
    @room = Room.find(params[:room_id])
  end

end

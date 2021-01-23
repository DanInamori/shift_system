class SchedulesController < ApplicationController
  before_action :set_room

  def new
    @schedule = Schedule.new
  end

  def create
    schedule = Schedule.new(schedule_params)
    if schedule.save
      redirect_to room_path(@room.id)
    else
      render :new
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
    @shift = Shift.find_by(user_id: current_user.id, schedule_id: @schedule.id)
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    schedule = Schedule.find(params[:id])
    if schedule.update(schedule_params)
      redirect_to room_path(@room.id)
    else
      render :edit
    end
  end

  private
  def schedule_params
    params
      .require(:schedule)
      .permit(:name, :first_day, :last_day)
      .merge(room_id: params[:room_id])
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

end

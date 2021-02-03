class SchedulesController < ApplicationController
  before_action :set_room
  before_action :move_to_root_path
  before_action :new_move_to_root_path, only: [:new, :create]
  
  def show
    @schedule = Schedule.find(params[:id])
    @shift = Shift.find_by(user_id: current_user.id, schedule_id: @schedule.id)
    @shift_creator = ShiftCreator.find_by(room_id: params[:room_id])
  end

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

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
    redirect_to room_path(@room.id)
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
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

  def move_to_root_path
    unless @room.user_ids.include?(current_user.id)
      redirect_to root_path
    end
  end

  def new_move_to_root_path
    @shift_creator = ShiftCreator.find_by(room_id: params[:room_id])
    unless @shift_creator.user_ids.include?(current_user.id)
      redirect_to root_path
    end
  end
  
end

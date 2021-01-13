class ShiftsController < ApplicationController

  def new
    @shift = Shift.new
    @room = Room.find(params[:room_id])
    @schedule = Schedule.find(params[:schedule_id])
  end

  def create
    @shift = Shift.new(shift_params)
    if @shift.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def shift_params
    params.require(:shift).permit(:shift, :comment).merge(user_id: current_user.id, schedule_id: params[:schedule_id])
  end
end

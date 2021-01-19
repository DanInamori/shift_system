class ShiftsController < ApplicationController

  def new
    @form = Form::ShiftCollection.new
    @room = Room.find(params[:room_id])
    @schedule = Schedule.find(params[:schedule_id])
  end

  def create
    @form = Form::ShiftCollection.new(shift_collection_params)
    if @form.valid?
      @form.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def shift_collection_params
    params
    .require(:form_shift_collection)
    .permit(shifts_attributes: [:work_day, :clock_in, :clock_out, :comment])
    .merge(shifts_attributes: [user_id: current_user.id, schedule_id: params[:schedule_id]])
  end
end

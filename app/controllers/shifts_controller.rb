class ShiftsController < ApplicationController

  def new
    @schedule = Schedule.find(params[:schedule_id])
    @form = Form::ShiftCollection.new({}, form_count)
    @room = Room.find(params[:room_id])
  end

  def create
    @form = Form::ShiftCollection.new(shift_collection_params)
    @form.register_ids(current_user.id, params[:schedule_id])
    if @form.valid?
      @form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end
  
  private

  def shift_collection_params
    params
    .require(:form_shift_collection)
    .permit(shifts_attributes: [:work_day, :clock_in, :clock_out, :comment])
  end

  def form_count
    schedule = Schedule.find(params[:schedule_id])
    day = (schedule.last_day - schedule.first_day).to_i + 1
  end

end

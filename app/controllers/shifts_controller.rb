class ShiftsController < ApplicationController
  before_action :new_move_to_index, only: [:new, :create]
  before_action :show_move_to_index, only: [:show]

  def index
    @schedule = Schedule.find(params[:schedule_id])
    @room = Room.find(params[:room_id])
    @shifts = Shift.where(schedule_id: @schedule.id)
  end

  def new
    @schedule = Schedule.find(params[:schedule_id])
    @form = Form::ShiftCollection.new({}, form_count)
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @schedule = Schedule.find(params[:schedule_id])
    @form = Form::ShiftCollection.new(shift_collection_params, form_count)
    @form.register_ids(current_user.id, params[:schedule_id])
    if @form.valid?
      @form.save
      redirect_to room_schedule_path(@room.id, @schedule.id )
    else
      render :new
    end
  end

  def show
    @schedule = Schedule.find(params[:schedule_id])
    @room = Room.find(params[:room_id])
    @shifts = Shift.where(user_id: current_user.id, schedule_id: @schedule.id)
  end
  
  private

  def shift_collection_params
    params
    .require(:form_shift_collection)
    .permit(shifts_attributes: [:work_day, :clock_in, :clock_out, :comment, :check])
  end

  def form_count
    schedule = Schedule.find(params[:schedule_id])
    day = (schedule.last_day - schedule.first_day).to_i + 1
  end

  def schedule_day
    schedule = Schedule.find(params[:schedule_id])
    first_day = @schedule.first_day
  end

  def new_move_to_index
    @schedule = Schedule.find(params[:schedule_id])
    @shift = Shift.find_by(user_id: current_user.id, schedule_id: @schedule.id)
    unless @shift == nil
      redirect_to root_path
    end
  end
  
  def show_move_to_index
    @schedule = Schedule.find(params[:schedule_id])
    @shift = Shift.find_by(user_id: current_user.id, schedule_id: @schedule.id)
    if @shift == nil
      redirect_to root_path
    end
  end

end

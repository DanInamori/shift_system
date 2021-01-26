class ShiftsController < ApplicationController
  before_action :set_room
  before_action :set_schedule
  before_action :move_to_root_path
  before_action :index_move_to_root_path, only: [:index]
  before_action :show_move_to_root_path, only: [:show]
  before_action :new_move_to_root_path, only: [:new, :create]

  def index  
    @shifts = Shift.where(schedule_id: @schedule.id)
  end
  
  def show 
    @shifts = Shift.where(user_id: current_user.id, schedule_id: @schedule.id)
  end

  def new
    @form = Form::ShiftCollection.new({}, form_count)
  end

  def create
    @form = Form::ShiftCollection.new(shift_collection_params, form_count)
    @form.register_ids(current_user.id, params[:schedule_id])
    if @form.valid?
      @form.save 
      redirect_to room_schedule_path(@room.id, @schedule.id )
    else
      render :new
    end
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

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_schedule
    @schedule = Schedule.find(params[:schedule_id])
  end

  def move_to_root_path
    unless @room.user_ids.include?(current_user.id)
      redirect_to root_path
    end
  end

  def index_move_to_root_path
    @shift_creator = ShiftCreator.find_by(room_id: params[:room_id])
    unless @shift_creator.user_ids.include?(current_user.id)
      redirect_to root_path
    end
  end
  
  def show_move_to_root_path
    @shift = Shift.find_by(user_id: current_user.id, schedule_id: @schedule.id)
    if @shift == nil || @shift.user_id != current_user.id
      redirect_to root_path
    end
  end

  def new_move_to_root_path
    @shift = Shift.find_by(user_id: current_user.id, schedule_id: @schedule.id)
    if @shift != nil
      redirect_to root_path
    end
  end

end

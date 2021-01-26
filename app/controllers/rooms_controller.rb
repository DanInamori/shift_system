class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :destroy, :edit, :update, :search]
  before_action :move_to_index, only: [:show, :destroy, :edit, :update, :search]
  PER = 10

  def index
    if current_user.rooms.present?
      @room = current_user.rooms.limit(1)
      redirect_to room_path(@room.ids)
    end
  end
  
  def show
    @schedules = Schedule.where(room_id: params[:id]).page(params[:page]).per(PER).order(created_at: 'desc')
  end
  
  def new
    @room = Room.new
  end
  
  def create
    room = Room.new(room_params)
    if room.save
      redirect_to room_path(room.id)
    else
      render :new
    end
  end
  
  def destroy
    @room.destroy
    redirect_to root_path
  end
  
  def edit
    @users = User.where(id: @room.user_ids)
    @shift_creator = ShiftCreator.find_by(room_id: params[:id])
  end

  def update
    if @room.update(room_params)
      redirect_to room_path(params[:id])
    else
      render :edit
    end
  end

  def search
    @schedules = Schedule.search(params[:keyword]).where(room_id: params[:id]).page(params[:page]).per(PER).order(created_at: 'desc')
  end
  
  private
  
  def room_params
    params
      .require(:room)
      .permit(:name, user_ids: [])
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def move_to_index
    unless @room.user_ids.include?(current_user.id)
      redirect_to root_path
    end
  end

  
end

class RoomsController < ApplicationController
  PER = 10
  def index
  end

  def show
    @room = Room.find(params[:id])
    @schedules = Schedule.where(room_id: params[:id]).page(params[:page]).per(PER).order(created_at: 'desc')
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to root_path
  end

  def edit
    @room = Room.find(params[:id])
    @users = User.where(id: @room.user_ids)
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to room_path(params[:id])
    else
      render :edit
    end
  end

  def search
    @room = Room.find(params[:id])
    @schedules = Schedule.search(params[:keyword]).where(room_id: params[:id]).page(params[:page]).per(PER).order(created_at: 'desc')
  end
  
  private
  
  def room_params
    params
      .require(:room)
      .permit(:name, user_ids: [])
  end
  
end

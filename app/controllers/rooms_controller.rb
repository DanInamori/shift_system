class RoomsController < ApplicationController
  def index
  end

  def show
    @room = Room.find(params[:id])
    @schedules = Schedule.all
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

  def search
    @room = Room.find(params[:id])
    @schedules = Schedule.search(params[:keyword])
  end
  
  private
  
  def room_params
    params
      .require(:room)
      .permit(:name, user_ids: [])
  end
  
end

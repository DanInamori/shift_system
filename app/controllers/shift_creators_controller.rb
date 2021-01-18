class ShiftCreatorsController < ApplicationController
  before_action :set_room
  def new
    @shift_creator = ShiftCreator.new
  end

  def create
    @shift_creator = ShiftCreator.new(shift_creator_params)
    @shift_creator.save  
    redirect_to room_path(@room.id)
  end

  private

  def shift_creator_params
    params
      .require(:shift_creator)
      .permit(user_ids: [])
      .merge(room_id: params[:room_id])
  end

  def set_room
    @room = Room.find(params[:room_id])
  end
end

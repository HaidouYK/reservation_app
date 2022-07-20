class RoomsController < ApplicationController
  def posts
    @rooms = current_user.rooms.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to room_path(@room.id), notice: "Room was successfully created."
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def search_area
    @rooms = Room.search_area(params[:search])
    @rooms_count = @rooms.count
  end

  def search_keyword
    @rooms = Room.search_keyword(params[:search])
    @rooms_count = @rooms.count
  end

  private
    def room_params
      params.require(:room).permit(:room_name, :room_profile, :room_price, :room_address, :room_image, :user_id)
    end
end

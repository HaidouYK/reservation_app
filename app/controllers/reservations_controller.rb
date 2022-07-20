class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new 
    @reservation = Reservation.new(new_reservation_params)
    @room = Room.find(params[:room_id])
    if @reservation.start_date.blank? || @reservation.end_date.blank? || @reservation.peoples.blank?
      redirect_to room_path(@room.id), alert: "開始日、終了日、人数全て入力してください"
    elsif @reservation.start_date < Date.today || @reservation.end_date < Date.today
      redirect_to room_path(@room.id), alert: "過去の日付は無効です"
    elsif (@reservation.end_date - @reservation.start_date).to_i < 0
      redirect_to room_path(@room.id), alert: "終了日は開始日より後にしてください"
    else
      @day = (@reservation.end_date - @reservation.start_date).to_i
      @price = @day * @room.room_price * @reservation.peoples
    end
  end

  def create
    @reservation = Reservation.new(create_reservation_params)
    @room = Room.find(@reservation.room_id)
    if @reservation.save
      redirect_to reservation_path(@reservation.id), notice: "Reservation was successfully created."
    else
      render :new
    end
  end

  def show 
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
  end

  private
    def new_reservation_params
      params.permit(:room_id, :start_date, :end_date, :peoples)
    end

    def create_reservation_params
      params.require(:reservation).permit(:user_id, :room_id, :start_date, :end_date, :peoples, :sum_price)
    end
end

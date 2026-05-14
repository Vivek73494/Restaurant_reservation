class ReservationsController < ApplicationController
  before_action :require_login

  def index
    @reservations = current_user.reservations.includes(:table).order(date: :desc, time_slot: :desc)
  end

  def new
    @reservation = current_user.reservations.build
    @reservation.table_id = params[:table_id] if params[:table_id]
    @tables = Table.all.order(:table_number)
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      redirect_to reservations_path, notice: "Table booked successfully!"
    else
      @tables = Table.all.order(:table_number)
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = current_user.reservations.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path, notice: "Reservation cancelled."
  end

  private

  def reservation_params
    params.require(:reservation).permit(:table_id, :date, :time_slot)
  end
end

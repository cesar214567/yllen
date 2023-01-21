class ReservationsController < ApplicationController
  def index
    if params[:query].present?
      @reservations = policy_scope(Reservation).general_search(params[:query]).page params[:page]
    else
      @reservations = policy_scope(Reservation).page params[:page]
    end
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservations_params)
    @reservation.user = current_user
    @reservation.item = Item.find(params[:item_id])
    @reservation.enabled = true
    @reservation.answered = false
    @reservation.save!
    redirect_to item_path(@reservation.item)

  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(update_params)
    redirect_to reservations_path
  end
  private

  def update_params
    params.require(:reservation).permit(:answered, :enabled)
  end

  def reservations_params
    params.require(:reservation).permit(:quantity)
  end

end

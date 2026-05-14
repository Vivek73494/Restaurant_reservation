class DashboardController < ApplicationController
  before_action :require_login

  def index
    @reservations_count = current_user.reservations.count
    @upcoming_reservations = current_user.reservations.where("date >= ?", Date.today).order(:date, :time_slot).limit(3)
  end
end

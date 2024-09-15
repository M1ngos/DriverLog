# app/controllers/drivers/shifts_controller.rb
module Drivers
  class ShiftsController < ApplicationController
    before_action :authenticate_driver!

    def create
      @shift = Shift.new(driver: current_driver, clock_in: Time.current)
      if @shift.save
        redirect_to driver_dashboard_path, notice: "Shift started successfully."
      else
        redirect_to driver_dashboard_path, alert: "Failed to start shift."
      end
    end

    def update
      @shift = Shift.find(params[:id])
      if @shift.update(clock_out: Time.current)
        redirect_to driver_dashboard_path, notice: "Shift ended successfully."
      else
        redirect_to driver_dashboard_path, alert: "Failed to end shift."
      end
    end
  end
end

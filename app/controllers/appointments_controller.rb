  class AppointmentsController < ApplicationController
before_action :set_appointment, only: [:destroy]

  def create
    @date = appointment_params[:appointment_date].to_date
    @time = DateTime.new(@date.year, @date.month, @date.mday, appointment_params[:appointment_time][0..1].to_i, 0)
    @appointment = Appointment.new(appointment_params)
    authorize @appointment
    @appointment.car_id = params[:car_id]
    @appointment.user = current_user
    @car = Car.find(params[:car_id])
    authorize @car

    if @appointment.save
      redirect_to @car, notice: 'appointment was successfully created.'
    else
      redirect_to @car, notice: 'error occured when booking appointment! Please try again... :('
    end
  end

  def destroy
    car_id = @appointment.car_id
    @appointment.destroy
    redirect = params[:return_to] || car_path(car_id)
    redirect_to redirect, notice: 'appointment was successfully destroyed.'
  end



private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
      authorize @appointment
    end

    # Only allow a trusted parameter "white list" through.
    def appointment_params
      params.require(:appointment).permit(:appointment_date, :appointment_time)
    end
end

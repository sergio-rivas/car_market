class AppointmentsController < ApplicationController

before_action :set_appointment, only: [:destroy]

  def create
    @date = appointment_params[:appointment_date].to_date
    @time = DateTime.new(@date.year, @date.month, @date.mday, appointment_params[:appointment_time][0..1].to_i, 0)
    @appointment = Appointment.new(appointment_params)
    @appointment.car_id = params[:car_id]
    @appointment.user = current_user
    @car = Car.find(params[:car_id])

    if @appointment.save
      redirect_to @car, notice: 'appointment was successfully created.'
    else
      redirect_to @car, notice: 'error occured when booking appointment! Please try again... :('
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_url, notice: 'appointment was successfully destroyed.'
  end



private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def appointment_params
      params.require(:appointment).permit(:appointment_date, :appointment_time)
    end
end

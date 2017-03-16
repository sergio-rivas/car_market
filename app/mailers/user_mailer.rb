class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.appointment.subject
  #
  def notify_owner(appointment)
    @appointment = appointment
    # mail(to: @appointment.car.user.email, subject: "New appointment for #{@appointment.car.brand.brand_name} #{@appointment.car.model.name}")
    # mail(to: @appointment.user.email, subject: "new appointment")
  end

  def notify_buyer(appointment)
    @appointment = appointment
    # mail(to: @appointment.user.email, subject: "New appointment for #{@appointment.car.brand.brand_name} #{@appointment.car.model.name}")
  end
end

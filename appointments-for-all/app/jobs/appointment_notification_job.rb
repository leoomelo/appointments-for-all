class AppointmentNotificationJob < ApplicationJob
  queue_as :default

  def perform(appointment)
    puts "Sending email informing that appointment: #{appointment.id} will be sent to #{appointment.customer.name} and #{appointment.professional.name}"
  end
end

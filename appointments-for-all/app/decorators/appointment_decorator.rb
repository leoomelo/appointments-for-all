class AppointmentDecorator
  def initialize(appointment)
    @appointment = appointment
  end

  def formatted_start_time_at
    @appointment.start_time_at.strftime("%d/%m/%Y - %H:%M")
  end

  def formatted_end_time_at
    @appointment.end_time_at.strftime("%d/%m/%Y - %H:%M")
  end
end
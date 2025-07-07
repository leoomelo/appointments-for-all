module AppointmentService
  class Create
    def initialize(params)
      @params = params
      @professional = Professional.find(params[:professional_id])
      @customer = Customer.find(params[:customer_id])
    end

    def call
      if has_conflict?
        add_conflict_error
      else
        Appointment.create(@params)
      end
    end

    def add_conflict_error
      appointment = Appointment.new(@params)
      appointment.errors.add(:base, "Schedule already taken for this professional.")
      appointment
    end

    def has_conflict?
      start_time = @params[:start_time_at]

      Appointment.where(professional_id: @params[:professional_id])
                 .where("start_time_at < ? AND end_time_at >= ?", start_time, start_time)
                 .exists?
    end
  end
end

# já existe um agendamento de 21 às 22
# se chegar um start entre 21 e 22 fudeu

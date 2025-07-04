class Appointment < ApplicationRecord
  belongs_to :customer
  belongs_to :professional

  validates :start_time_at, :end_time_at, :customer, :professional, presence: true
  validate :start_time_at_before_end_time_at

  def start_time_at_before_end_time_at
    if start_time_at >= end_time_at
      errors.add(:start_date, "Must be previous than end_time_at")
    end
  end
end

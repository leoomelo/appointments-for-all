class Appointment < ApplicationRecord
  belongs_to :customer
  belongs_to :professional

  validates :start_time_at, :end_time_at, :customer, :professional, presence: true
  validate :start_time_at_before_end_time_at
  validate :start_time_at_only_in_the_future

  def start_time_at_before_end_time_at
    if start_time_at >= end_time_at
      errors.add(:start_time_at, "Must be previous than end_time_at")
    end
  end

  def start_time_at_only_in_the_future
    if start_time_at < Time.current
      errors.add(:start_time_at, "Must be in the future")
    end
  end
end

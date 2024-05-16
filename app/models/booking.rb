class Booking < ApplicationRecord
  belongs_to :dog
  belongs_to :user

  STATUS = ["pending", "cancelled", "accepted", "rejected", "completed"]
  validates :status, inclusion: { in: STATUS }

  validate :start_time_cannot_be_in_the_past
  validate :end_time_cannot_be_before_start_time

  def pending?
    status == 'pending'
  end

private

  def start_time_cannot_be_in_the_past
    errors.add(:start_time, "can't be in the past") if start_time < Date.today
  end

  def end_time_cannot_be_before_start_time
    errors.add(:end_time, "can't be before the start time") if end_time < start_time
  end


end

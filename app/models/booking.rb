class Booking < ApplicationRecord
  belongs_to :dog
  belongs_to :user
  STATUS = ["pending", "cancelled", "accepted", "rejected", "completed"]
  validates :status, inclusion: { in: STATUS }
end

class Dog < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookings
  has_many_attached :photos

  validates :name, presence: true, length: { within: 3..20 }
  validates :age, presence: true
  BREEDS = ["shiba", "corgie", "husky", "daschund", "poodle"]
  validates :breed, presence: true, inclusion: { in: BREEDS }
  validates :price, presence: true
end

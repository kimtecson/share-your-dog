class User < ApplicationRecord
  has_many :dogs, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy


  # geocoder logic for map
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  # devise settings for log-in / register logic
  validates :name, presence: true, length: { within: 3..20 }
  validates :age, numericality: { greater_than_or_equal_to: 18 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

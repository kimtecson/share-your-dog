class User < ApplicationRecord
  has_many :dogs, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookings, dependent: :destroy
  # has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true, length: { within: 3..20 }
  validates :age, numericality: { greater_than_or_equal_to: 18 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

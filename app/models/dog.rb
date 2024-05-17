class Dog < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :reviews
  has_many :bookings
  has_many_attached :photos

  validates :name, presence: true, length: { within: 3..20 }
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 0 }
  BREEDS = ["Shiba", "Corgie", "Husky", "Daschund", "Poodle"]
  validates :breed, presence: true, inclusion: { in: BREEDS }
  validates :price, presence: true
    # acts_as_taggable_on :tags

  pg_search_scope :search_by,
  against: [ :name, :breed, :age ],
  associated_against: {
    user: [ :name, :address ]
  },
  using: {
    tsearch: { prefix: true }
  }
end

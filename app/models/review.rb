class Review < ApplicationRecord
  belongs_to :dog
  belongs_to :user
  # validates :rating, presence: true, scope: { within: 1..5 }
end

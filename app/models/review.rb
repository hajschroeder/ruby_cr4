class Review < ApplicationRecord
  belongs_to :product, optional: true
  validates :author, presence: true
  validates :content_body, presence: true
  validates :rating, presence: true
  validates_length_of :content_body, maximum: 250
  validates_length_of :content_body, minimum: 50
  validates_numericality_of :rating, only_integer: true
  validates_numericality_of :rating, less_than_or_equal_to: 5
  validates_numericality_of :rating, greater_than_or_equal_to: 1

  scope :three_most_recent, -> { order(created_at: :desc).limit(3) }
end

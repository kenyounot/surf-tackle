class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :title, presence: true
  validates :stars, numericality: { greater_than_or_equal_to: 0, less_than: 6 }
end

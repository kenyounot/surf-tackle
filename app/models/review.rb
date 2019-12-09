class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item

  accepts_nested_attributes_for :item

  validates :title, presence: true
  validates :stars, numericality: { greater_than_or_equal_to: 0, less_than: 6 }

  validates :item, uniqueness: {scope: :user, message: '- user can only review an item once.'}
end

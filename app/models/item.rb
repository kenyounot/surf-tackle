class Item < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  has_one_attached :item_image

  accepts_nested_attributes_for :brand
end

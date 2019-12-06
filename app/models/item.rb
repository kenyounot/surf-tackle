class Item < ApplicationRecord
  belongs_to :brand
  has_many :reviews
  has_many :users, through: :reviews

  accepts_nested_attributes_for :brand
end

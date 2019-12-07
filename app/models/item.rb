class Item < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  has_one_attached :item_image

  def brand_attributes=(attributes)
    Brand.find_or_create_by(attributes) if !attributes['name'].empty?
  end

  def not_a_duplicate
    
  end

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :description, presence: true
  
end

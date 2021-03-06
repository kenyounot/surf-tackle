class Item < ApplicationRecord
  belongs_to :brand
  belongs_to :user
  has_many :reviews, :dependent => :destroy
  has_many :users, through: :reviews
  has_one_attached :item_image

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: true
  validates :description, presence: true

  def brand_attributes=(attributes)
    Brand.find_or_create_by(attributes) if !attributes['name'].empty?
  end

  scope :order_by_rating, -> {joins(:reviews).group(:id).order('avg(stars) desc')}

  def self.alpha_order
    order(:name)
  end


  
  def item_and_brand
    "#{name} - #{brand.name}"
  end



  
end

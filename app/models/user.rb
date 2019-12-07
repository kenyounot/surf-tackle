class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :reviews
  has_many :reviewed_items, through: :reviews, source: :item

  has_many :items    

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_name, presence: true
  validates :user_name, uniqueness: true
end

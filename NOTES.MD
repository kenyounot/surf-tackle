# Surf Tackle

## User
    * first_name
    * last_name
    * user_name
    * email
    * password(encrypted)

    * has_many :reviews
    * has_many :items, through: :reviews

## Items
    * Name
    * Price
    * Description

    * belongs_to :brand 
    * has_many :reviews
    * has_many :users, through: :reviews

## Brand
    * Name

    * has_many :items

## Review
    * Stars
    * Title
    * Content

    * belongs_to :user
    * belongs_to :item 


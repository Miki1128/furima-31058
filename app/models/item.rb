class Item < ApplicationRecord
  has_one :purchase_record
  has_one_attached :image
  belongs_to :user
  
  line = {other_than: 0 }
 
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: {with: line, message:  "can't be blank"}
    validates :status_id, numericality: {with: line, message:  "can't be blank"}
    validates :shipping_cost_id, numericality: {with: line, message:  "can't be blank"}
    validates :prefecture_id , numericality: {with: line, message:  "can't be blank"}
    validates :shipping_day_id, numericality: {with: line, message:  "can't be blank"}
    validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 1000000, message: "is out of setting range"}
  end
end



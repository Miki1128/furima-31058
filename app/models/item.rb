class Item < ApplicationRecord
  has_one :purchase_record
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :status
  belongs_to_active_hash :category

  with_options presence: true do
    validates :image
    validates :name
    validates :description

    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :status_id
      validates :shipping_cost_id
      validates :prefecture_id
      validates :shipping_day_id
      validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
      validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 1_000_000, message: 'is out of setting range' }
    end
  end
end

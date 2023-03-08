class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id: true
  validates :situation_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :sender_id, presence: true
  validates :number_of_day_id, presence: true
  validates :price, presence: true
  validates :user, presence: true, foreign_key: true

  belongs_to :user
  has_one_attached :image
  # has_one :card
end

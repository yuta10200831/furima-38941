class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # itemテーブルvalidates
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :situation_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :sender_id, presence: true
  validates :number_of_day_id, presence: true
  validates :price, presence: true

  belongs_to :user
  has_one_attached :image
  # has_one :card 後ほど追加する

  # アクティブハッシュのアソシエーション
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :number_of_day
  belongs_to :sender
  belongs_to :situation

  with_options numericality: { other_than: 0 } do
    validates :category
    validates :dlivery
    validates :number_of_day
    validates :sender
    validates :situation
  end
end

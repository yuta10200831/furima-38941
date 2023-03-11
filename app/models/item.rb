class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # itemテーブルvalidates
  validates :image, presence: true
  validates :item_name, presence: true
  validates :image, presence:true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :situation_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :sender_id, presence: true
  validates :number_of_day_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer:true }

  belongs_to :user
  has_one_attached :image
  # has_one :card 後ほど追加する

  # アクティブハッシュのアソシエーション
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :number_of_day
  belongs_to :sender
  belongs_to :situation

  # ---が選択された時保存できないバリデーション
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :delivery_charge_id
    validates :number_of_day_id
    validates :sender_id
    validates :situation_id
  end
end

class Category < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_date

  validates :title, :text, presence: true
  validates :genre_id, numericality: { other_than: 1 } 
  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}

end

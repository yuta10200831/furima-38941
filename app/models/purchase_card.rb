class PurchaseCard
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :sender_id, :city, :city_number, :building_name, :telephone_number, :token

  with_options presence: true do
    validates :post_code
    validates :sender_id
    validates :city
    validates :city_number
    validates :telephone_number
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    card = Card.create(user_id: user_id, item_id: item_id)
    Purchase.create(card_id: card.id, post_code: post_code, sender_id: sender_id, city: city, city_number: city_number, building_name: building_name, telephone_number: telephone_number)
  end
end
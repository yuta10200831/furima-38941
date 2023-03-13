class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string     :post_code,         null: false
      t.integer    :sender_id,         null: false
      t.string     :city,              null: false
      t.string     :city_number,       null: false
      t.string     :building_name
      t.string     :telephone_number,  null: false
      t.references :card,              null: false, foreign_key: true
      t.timestamps
    end
  end
end

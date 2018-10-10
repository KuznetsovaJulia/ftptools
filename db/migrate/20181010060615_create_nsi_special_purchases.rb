class CreateNsiSpecialPurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_special_purchases do |t|
      t.bigint :special_purchase_id
      t.string :code
      t.text :short_name
      t.text :full_name
      t.boolean :actual, default: false
      t.text :tender_plan2017_short
      t.text :tender_plan_2017_full
      t.jsonb :data

      t.index :special_purchase_id, unique: true

      t.timestamps
    end
  end
end

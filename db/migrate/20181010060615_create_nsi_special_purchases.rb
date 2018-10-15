class CreateNsiSpecialPurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_special_purchases,id: false do |t|
      t.bigint :id , auto_increment: false, primary_key: true, default: nil
      t.index :id, unique: true
      t.string :code
      t.text :short_name
      t.text :full_name
      t.boolean :actual, default: false
      t.text :tender_plan2017_short
      t.text :tender_plan_2017_full
      t.jsonb :data

      t.timestamps
    end
  end
end

class CreateNsiSingleCustomerReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_single_customer_reasons do |t|
      t.jsonb :data
      t.string :name
      t.boolean :actual, default: false
      t.bigint :single_customer_reason_id
      t.index :single_customer_reason_id, unique: true

      t.timestamps
    end
  end
end

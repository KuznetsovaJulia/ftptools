class CreateNsiContractSingleCustomerReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_contract_single_customer_reasons,id:false do |t|
      t.bigint :id , auto_increment: false, primary_key: true, default: nil
      t.index :id, unique: true
      t.jsonb :data
      t.string :name
      t.boolean :actual, default: false

      t.timestamps
    end
  end
end

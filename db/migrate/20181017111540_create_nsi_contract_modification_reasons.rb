class CreateNsiContractModificationReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_contract_modification_reasons do |t|
      t.string :code, index: { unique: true }
      t.string :name
      t.boolean :actual, default: false
      t.jsonb :data

      t.timestamps
    end
  end
end

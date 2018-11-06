class CreateNsiContractTerminationReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_contract_termination_reasons,id: false do |t|
      t.bigint :id , auto_increment: false, primary_key: true, default: nil
      t.index :id, unique: true
      t.string :name
      t.boolean :actual
      t.jsonb :data
      t.string :code
      t.index :code, unique: true


      t.timestamps
    end
  end
end

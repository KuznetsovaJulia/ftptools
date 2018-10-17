class CreateNsiContractExecutionDocs < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_contract_execution_docs do |t|
      t.string :name
      t.string :code
      t.boolean :actual, default: false
      t.jsonb :data

      t.timestamps
    end
  end
end

class CreateNsiContractPenaltyReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_contract_penalty_reasons do |t|
      t.string :name
      t.string :code, index: { unique: true }
      t.boolean :actual
      t.jsonb :data
      t.string :penalty_type

      t.timestamps
    end
  end
end

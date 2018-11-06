class CreateNsiTenderPlan2017ContractLifeCycleCases < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_tender_plan2017_contract_life_cycle_cases, id: false do |t|
      t.bigint :id, auto_increment: false, primary_key: true, default: nil
      t.index :id, unique: true
      t.string :code
      t.boolean :actual
      t.jsonb :data

      t.timestamps
    end
  end
end

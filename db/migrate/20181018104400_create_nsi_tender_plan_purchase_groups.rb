class CreateNsiTenderPlanPurchaseGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_tender_plan_purchase_groups, id: false do |t|
      t.bigint :id, auto_increment: false, primary_key: true, default: nil
      t.index :id, unique: true
      t.boolean :actual, default: false
      t.string :code
      t.jsonb :data

      t.timestamps
    end
  end
end

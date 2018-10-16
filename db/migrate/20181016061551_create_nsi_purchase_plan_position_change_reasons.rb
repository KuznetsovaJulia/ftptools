class CreateNsiPurchasePlanPositionChangeReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_purchase_plan_position_change_reasons,id:false do |t|
      t.bigint :id , auto_increment: false, primary_key: true, default: nil
      t.index :id, unique: true
      t.string :code
      t.string :short_name
      t.text :description
      t.string :legal_act_details
      t.jsonb :data
      t.boolean :actual

      t.timestamps
    end
  end
end

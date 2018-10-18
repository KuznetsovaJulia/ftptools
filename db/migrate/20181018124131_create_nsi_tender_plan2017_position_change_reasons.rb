class CreateNsiTenderPlan2017PositionChangeReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_tender_plan2017_position_change_reasons, id: false do |t|
      t.bigint :id, auto_increment: false, primary_key: true, default: nil
      t.index :id, unique: true
      t.string :code
      t.boolean :actual
      t.jsonb :data

      t.timestamps
    end
  end
end

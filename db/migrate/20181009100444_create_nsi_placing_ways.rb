class CreateNsiPlacingWays < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_placing_ways do |t|

      t.string :code
      t.string :name
      t.boolean :actual
      t.string :placing_way_type
      t.boolean :is_procedure
      t.jsonb :data
      t.boolean :used_in_rpg, default: false
      t.boolean :rpg_joint, default: false
      t.bigint :placing_way_id, null: false, unique: true, default: nil

      t.index :placing_way_id, unique: true


      t.timestamps
    end
  end
end

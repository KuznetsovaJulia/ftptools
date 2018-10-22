class CreateNsiKosgus < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_kosgus do |t|
      t.string :code, index: { unique: true }
      t.boolean :actual
      t.jsonb :data

      t.timestamps
    end
  end
end

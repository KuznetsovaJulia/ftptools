class CreateNsiKvrs < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_kvrs do |t|
      t.string :code, index: { unique: true }
      t.boolean :actual
      t.jsonb :data

      t.timestamps
    end
  end
end

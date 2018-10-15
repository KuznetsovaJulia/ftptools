class CreateNsiOktmos < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_oktmos do |t|
      t.string :code
      t.string :parent_code
      t.string :fullname
      t.boolean :actual
      t.jsonb :data
      t.string :section
      t.date :last_update_date
      t.index :code, unique: true

      t.timestamps
    end
  end
end

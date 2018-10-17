class CreateNsiOksms < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_oksms do |t|
      t.string :country_code, index: { unique: true }
      t.boolean :actual
      t.jsonb :data
      t.string :country_full_name

      t.timestamps
    end
  end
end

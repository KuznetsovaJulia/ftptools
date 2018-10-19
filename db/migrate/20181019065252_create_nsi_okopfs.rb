class CreateNsiOkopfs < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_okopfs do |t|
      t.string :code, index: { unique: true }
      t.string :parent_code
      t.boolean :actual, default: false
      t.jsonb :data

      t.timestamps
    end
  end
end

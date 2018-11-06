class CreateNsiOkved2s < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_okved2s, id: false do |t|
      t.bigint :id, auto_increment: false, primary_key: true, default: nil
      t.index :id, unique: true
      t.boolean :actual, default: false
      t.string :code
      t.string :name
      t.jsonb :data

      t.timestamps
    end
  end
end

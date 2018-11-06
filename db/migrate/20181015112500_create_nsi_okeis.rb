class CreateNsiOkeis < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_okeis do |t|
      t.string :code
      t.index :code, unique: true
      t.string :fullname
      t.string :section_code
      t.string :section_name
      t.bigint :group_id
      t.string :group_name
      t.string :local_name
      t.string :international_name
      t.string :local_symbol
      t.string :international_symbol
      t.boolean :actual
      t.boolean :is_temporaryfor_ktru
      t.jsonb :data

      t.timestamps
    end
  end
end

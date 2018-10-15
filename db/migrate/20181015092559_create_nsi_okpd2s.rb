class CreateNsiOkpd2s < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_okpd2s,id: false do |t|
      t.string :code
      t.index :code, unique: true

      t.string :name
      t.string :comment
      t.bigint :id , auto_increment: false, primary_key: true, default: nil
      t.index :id, unique: true
      t.bigint :parent_id
      t.string :parent_code
      t.jsonb :data
      t.boolean :actual

      t.timestamps
    end
  end
end

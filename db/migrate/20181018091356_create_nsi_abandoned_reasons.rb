class CreateNsiAbandonedReasons < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_abandoned_reasons , id: false do |t|
      t.bigint :id, auto_increment: false, primary_key: true, default: nil
      t.index :id, unique: true
      t.string :name
      t.string :code
      t.jsonb :data

      t.timestamps
    end
  end
end

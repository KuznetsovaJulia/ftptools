class CreateNsiKtrus < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_ktrus do |t|
      t.string :code
      t.index :code, unique: true
      t.integer :version, null: false
      t.date :inclusion_date
      t.date :publish_date
      t.string :name
      t.string :external_code
      t.string :parent_code
      t.string :okpd2_code
      t.boolean :actual, default: false
      t.date :application_date_start
      t.text :description
      t.jsonb :data

      t.timestamps
    end
  end
end

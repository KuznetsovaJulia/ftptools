# frozen_string_literal: true

class CreateUnfairSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :unfair_suppliers do |t|
      t.string :registry_num
      t.index :registry_num, unique: true
      t.date :publish_date
      t.date :approve_date
      t.string :state
      t.string :full_name
      t.string :view
      t.string :firm_name
      t.string :inn
      t.index :inn, unique: true
      t.jsonb :data
      t.references :loaded_unfair_supplier, foreign_key: true
      t.timestamps
    end
  end
end

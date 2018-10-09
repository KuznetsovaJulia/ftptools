# frozen_string_literal: true

class CreateLoadedUnfairSuppliers < ActiveRecord::Migration[5.1]
  def change
    create_table :loaded_unfair_suppliers do |t|
      t.string :name
      t.index :name, unique: true
      t.string :number
      t.text :files_array, array: true
      t.boolean :downloaded

      t.timestamps
    end
  end
end

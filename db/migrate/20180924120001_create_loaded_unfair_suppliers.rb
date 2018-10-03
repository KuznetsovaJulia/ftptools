class CreateLoadedUnfairSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :loaded_unfair_suppliers do |t|
      t.string :name
      t.string :number, :unique => true
      t.boolean :downloaded


      t.timestamps
    end
  end
end

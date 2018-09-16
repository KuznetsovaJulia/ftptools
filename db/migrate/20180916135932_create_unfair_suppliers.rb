class CreateUnfairSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :unfair_suppliers do |t|
      t.string :inn
      t.string :kpp
      t.string :full_name
      t.jsonb :data

      t.timestamps
    end
  end
end

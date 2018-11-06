# frozen_string_literal: true

class CreateFasUnfairSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :fas_unfair_suppliers do |t|
      t.string :registry_num, index: { unique: true }
      t.date :publish_date
      t.date :approve_date
      t.string :state
      t.string :full_name
      t.string :firm_name
      t.string :inn
      t.jsonb :data
      t.timestamps
    end
  end
end

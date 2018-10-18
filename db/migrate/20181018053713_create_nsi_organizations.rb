class CreateNsiOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_organizations do |t|
      t.string :reg_number
      t.string :full_name
      t.string :inn, index: { unique: true }
      t.string :kpp
      t.string :ogrn
      t.jsonb :data

      t.timestamps
    end
  end
end

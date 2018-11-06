class CreateNsiOrganizationTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :nsi_organization_types do |t|
      t.string :code, index: { unique: true }
      t.string :name
      t.jsonb :data

      t.timestamps
    end
  end
end

class CreateTestOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :test_organizations do |t|
      t.string :name
      t.string :full_name
      t.string :inn
      t.string :state
      t.boolean :is_grbs, default: false
      t.integer :grbs_id
      t.string :district
      t.jsonb :data
      t.jsonb :settings
      t.integer :organization_directory_id
      t.boolean :subordinated, default: false
      t.boolean :districted, default: false
      t.integer :eis_organization_id
      t.string :eis_login
      t.string :eis_password


      t.timestamps null: false
    end
  end
end

class AddDetailsToTestOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :test_organizations, :okogu, :jsonb,
               default: { "code": "4210007", "name": "Муниципальные организации" }
    add_column :test_organizations, :grbs_inn, :string
    add_column :test_organizations, :oktmoppo, :jsonb,
               default: { "code" => "92701000", "name" => "город Казань" }
    add_column :test_organizations, :grbs_code, :string
    add_column :test_organizations, :grbs_type, :string
    add_index :test_organizations, :inn
  end
end


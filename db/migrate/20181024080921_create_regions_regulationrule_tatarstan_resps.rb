class CreateRegionsRegulationruleTatarstanResps < ActiveRecord::Migration[5.2]
  def change
    create_table :regions_regulationrule_tatarstan_resps, id: false do |t|
      t.bigint :id, auto_increment: false, primary_key: true, default: nil
      t.index :id, unique: true
      t.date :doc_publish_date
      t.string :registry_num
      t.jsonb :data

      t.timestamps
    end
  end
end

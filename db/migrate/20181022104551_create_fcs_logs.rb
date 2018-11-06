class CreateFcsLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :fcs_logs do |t|
      t.string :name_model
      t.string :file_name

      t.timestamps
    end
  end
end

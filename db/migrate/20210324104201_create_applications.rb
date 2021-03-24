class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.string :api_key, null: false

      t.timestamps
    end
    add_index :applications, :api_key, unique: true
  end
end

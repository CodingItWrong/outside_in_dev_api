class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.string :apiKey, null: false

      t.timestamps
    end
    add_index :applications, :apiKey, unique: true
  end
end

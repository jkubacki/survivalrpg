class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.string :name
      t.text :description
      t.integer :frequency

      t.timestamps null: false
    end
  end
end

class CreateDistricts < ActiveRecord::Migration[6.0]
  def change
    create_table :districts do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :districts, :name, unique: true
  end
end

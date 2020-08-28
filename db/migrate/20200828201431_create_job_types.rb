class CreateJobTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :job_types do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :slug, null: false

      t.timestamps
    end
    add_index :job_types, :slug, unique: true
  end
end
